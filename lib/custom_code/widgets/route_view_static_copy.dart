// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;

import 'package:google_maps_flutter/google_maps_flutter.dart' as latlng;

import 'dart:math' show cos, sqrt, asin;

class RouteViewStaticCopy extends StatefulWidget {
  const RouteViewStaticCopy({
    Key? key,
    this.width,
    this.height,
    required this.currentOrder,
    this.lineColor = Colors.black,
    required this.iOSGoogleMapsApiKey,
    required this.androidGoogleMapsApiKey,
    required this.webGoogleMapsApiKey,
    required this.geoCodeList,
    required this.startAddress,
  }) : super(key: key);

  final double? height;
  final double? width;
  final int currentOrder;
  final Color lineColor;
  final String iOSGoogleMapsApiKey;
  final String androidGoogleMapsApiKey;
  final String webGoogleMapsApiKey;
  final List<String> geoCodeList;
  final LatLng startAddress;

  @override
  _RouteViewStaticCopyState createState() => _RouteViewStaticCopyState();
}

class _RouteViewStaticCopyState extends State<RouteViewStaticCopy> {
  late final CameraPosition _initialLocation;
  GoogleMapController? mapController;

  String? _placeDistance;
  Set<Marker> markers = {};

  PolylinePoints? polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<latlng.LatLng> polylineCoordinates = [];

  String getLatitude(String geoCode) {
    int index = geoCode.indexOf(",");
    String result = geoCode.substring(0, index - 1);
    return result;
  }

  String getLongitude(String geoCode) {
    int index = geoCode.indexOf(",");
    String result = geoCode.substring(index + 1);
    return result;
  }

  String get googleMapsApiKey {
    /*if (kIsWeb) {
      return widget.webGoogleMapsApiKey;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return '';
      case TargetPlatform.iOS:
        return widget.iOSGoogleMapsApiKey;
      case TargetPlatform.android:
        return widget.androidGoogleMapsApiKey;
      default:
        return widget.webGoogleMapsApiKey;
    }*/
    return widget.androidGoogleMapsApiKey;
  }

  // Method for calculating the distance between two places
  Future<bool> _calculateDistance() async {
    setState(() {
      if (markers.isNotEmpty) markers.clear();
      if (polylines.isNotEmpty) polylines.clear();
      if (polylineCoordinates.isNotEmpty) polylineCoordinates.clear();
      _placeDistance = null;
    });

    try {
      // Use the retrieved coordinates of the current position,
      // instead of the address if the start position is user's
      // current position, as it results in better accuracy.
      //String startLng = getLongitude(widget.geoCodeList[0]);
      String endLat =
          getLatitude(widget.geoCodeList[widget.geoCodeList.length - 1]);
      String endLng =
          getLongitude(widget.geoCodeList[widget.geoCodeList.length - 1]);
      String curLat = widget.currentOrder <= 1
          ? ""
          : getLatitude(widget.geoCodeList[widget.currentOrder - 1]);
      String curLng = widget.currentOrder <= 1
          ? ""
          : getLongitude(widget.geoCodeList[widget.currentOrder - 1]);

      double startLatitude = widget.startAddress.latitude;
      double startLongitude = widget.startAddress.longitude;

      double destinationLatitude = double.parse(endLat);
      double destinationLongitude = double.parse(endLng);

      double currentLatitude = widget.currentOrder <= 1
          ? widget.startAddress.latitude
          : double.parse(curLat);
      double currentLongitude = widget.currentOrder <= 1
          ? widget.startAddress.longitude
          : double.parse(curLng);

      String currentCoordinateString = '($currentLatitude, $currentLongitude)';

      // Start Location Marker
      Marker currentMarker = Marker(
        markerId: MarkerId(currentCoordinateString),
        position: latlng.LatLng(currentLatitude, currentLongitude),
        infoWindow: InfoWindow(
          title: 'Current $currentCoordinateString',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      );

      markers.add(currentMarker);

      for (var i = 0; i <= widget.geoCodeList.length; i++) {
        int index = i;
        String geoString = widget.geoCodeList[i];
        String lat = getLatitude(geoString);
        String lng = getLongitude(geoString);
        markers.add(Marker(
          markerId: MarkerId(index.toString()),
          position: latlng.LatLng(double.parse(lat), double.parse(lng)),
          infoWindow: InfoWindow(
            title: '$geoString',
            snippet: geoString ?? '',
          ),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        ));
      }
      // Adding the markers to the list

      debugPrint(
        'MAP::START COORDINATES: ($startLatitude, $startLongitude)',
      );
      debugPrint(
        'MAP::DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
      );

      // Calculating to check that the position relative
      // to the frame, and pan & zoom the camera accordingly.
      double miny = (startLatitude <= destinationLatitude)
          ? startLatitude
          : destinationLatitude;
      double minx = (startLongitude <= destinationLongitude)
          ? startLongitude
          : destinationLongitude;
      double maxy = (startLatitude <= destinationLatitude)
          ? destinationLatitude
          : startLatitude;
      double maxx = (startLongitude <= destinationLongitude)
          ? destinationLongitude
          : startLongitude;

      double southWestLatitude = miny;
      double southWestLongitude = minx;

      double northEastLatitude = maxy;
      double northEastLongitude = maxx;

      // Accommodate the two locations within the
      // camera view of the map
      mapController?.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            northeast: latlng.LatLng(northEastLatitude, northEastLongitude),
            southwest: latlng.LatLng(southWestLatitude, southWestLongitude),
          ),
          60.0,
        ),
      );
      await _createPolylines(startLatitude, startLongitude, destinationLatitude,
          destinationLongitude);

      double totalDistance = 0.0;

      // Calculating the total distance by adding the distance
      // between small segments
      for (int i = 0; i < polylineCoordinates.length - 1; i++) {
        totalDistance += _coordinateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude,
        );
      }

      _placeDistance = totalDistance.toStringAsFixed(2);
      debugPrint('MAP::DISTANCE: $_placeDistance km');
      FFAppState().routeDistance = '$_placeDistance km';

      var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/distancematrix/json?destinations=$destinationLatitude,$destinationLongitude&origins=$startLatitude,$startLongitude&key=$googleMapsApiKey',
      );
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

        final String durationText =
            jsonResponse['rows'][0]['elements'][0]['duration']['text'];
        debugPrint('MAP::$durationText');
        FFAppState().routeDuration = '$durationText';
      } else {
        debugPrint('ERROR in distance matrix API');
      }

      setState(() {});

      return true;
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  // Formula for calculating distance between two coordinates
  // https://stackoverflow.com/a/54138876/11910277
  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  _createPolylines(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  ) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints!.getRouteBetweenCoordinates(
      googleMapsApiKey, // Google Maps API Key
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.driving,
    );

    debugPrint('MAP::STATUS: ${result.status}');
    debugPrint('MAP::POLYLINES: ${result.points.length}');

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(latlng.LatLng(point.latitude, point.longitude));
      });
    }

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Color.fromRGBO(255, 0, 0, 1),
      points: polylineCoordinates,
      width: 3,
    );
    polylines[id] = polyline;
  }

  @override
  void initState() {
    final startCoordinate = latlng.LatLng(
      widget.startAddress.latitude,
      widget.startAddress.longitude,
    );
    _initialLocation = CameraPosition(
      target: startCoordinate,
      zoom: 4,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: GoogleMap(
        markers: Set<Marker>.from(markers),
        initialCameraPosition: _initialLocation,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: false,
        polylines: Set<Polyline>.of(polylines.values),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
          _calculateDistance();
        },
      ),
    );
  }
}
