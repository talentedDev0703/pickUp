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

class RouteViewStatic extends StatefulWidget {
  const RouteViewStatic({
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
  _RouteViewStaticState createState() => _RouteViewStaticState();
}

class _RouteViewStaticState extends State<RouteViewStatic> {
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
    if (kIsWeb) {
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
    }
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
      String endLat =
          getLatitude(widget.geoCodeList[widget.geoCodeList.length - 1]);
      String endLng =
          getLongitude(widget.geoCodeList[widget.geoCodeList.length - 1]);
      String curLat = widget.currentOrder <= 1
          ? ""
          : getLatitude(widget.geoCodeList[widget.currentOrder - 2]);
      String curLng = widget.currentOrder <= 1
          ? ""
          : getLongitude(widget.geoCodeList[widget.currentOrder - 2]);

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
      String startCoordinateString = '($startLatitude, $startLongitude)';

      // Start Location Marker
      Marker startmarker = Marker(
        markerId: MarkerId(startCoordinateString),
        position: latlng.LatLng(startLatitude, startLongitude),
        infoWindow: InfoWindow(
          title: 'Start $startCoordinateString',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
      );

      markers.add(startmarker);

      Marker currentMarker = Marker(
        markerId: MarkerId(currentCoordinateString),
        position: latlng.LatLng(currentLatitude, currentLongitude),
        infoWindow: InfoWindow(
          title: 'Current $currentCoordinateString',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      );
      if (widget.currentOrder > 1) {
        markers.add(currentMarker);
      }
      for (var i = 0; i <= widget.geoCodeList.length - 1; i++) {
        if (i == widget.currentOrder - 2) continue;
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
      if (widget.currentOrder <= 1) {
        await _createPolylines(
            startLatitude,
            startLongitude,
            double.parse(getLatitude(widget.geoCodeList[0])),
            double.parse(getLongitude(widget.geoCodeList[0])),
            true);
      } else {
        await _createPolylines(
            startLatitude,
            startLongitude,
            double.parse(getLatitude(widget.geoCodeList[0])),
            double.parse(getLongitude(widget.geoCodeList[0])),
            true);
      }

      for (int idx = 0; idx < widget.geoCodeList.length - 1; idx++) {
        if (idx == widget.currentOrder - 2) {
          await _createPolylines(
              double.parse(getLatitude(widget.geoCodeList[idx])),
              double.parse(getLongitude(widget.geoCodeList[idx])),
              double.parse(getLatitude(widget.geoCodeList[idx + 1])),
              double.parse(getLongitude(widget.geoCodeList[idx + 1])),
              true);
        } else {
          await _createPolylines(
              double.parse(getLatitude(widget.geoCodeList[idx])),
              double.parse(getLongitude(widget.geoCodeList[idx])),
              double.parse(getLatitude(widget.geoCodeList[idx + 1])),
              double.parse(getLongitude(widget.geoCodeList[idx + 1])),
              false);
        }
      }

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

  // Create the polylines for showing the route between two places
  List<PolylineWayPoint> stopPositions = [];
  _getStopPositions() {
    if (widget.geoCodeList.length < 2) return;
    for (int idx = 0; idx <= widget.geoCodeList.length - 2; idx++) {
      String lat = getLatitude(widget.geoCodeList[idx]);
      String lng = getLongitude(widget.geoCodeList[idx]);
      String tmp = '$lat%2C1$lng';
      stopPositions.add(PolylineWayPoint(location: tmp, stopOver: true));
    }
  }

  _createPolylines(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
    bool highLight,
  ) async {
    //await _getStopPositions();
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
      color: highLight ? Color.fromRGBO(255, 0, 0, 1) : widget.lineColor,
      points: polylineCoordinates,
      width: 3,
    );
    polylines[id] = polyline;
  }

  @override
  void initState() {
    String curLat = widget.currentOrder <= 1
        ? ""
        : getLatitude(widget.geoCodeList[widget.currentOrder - 1]);
    String curLng = widget.currentOrder <= 1
        ? ""
        : getLongitude(widget.geoCodeList[widget.currentOrder - 1]);
    double currentLatitude = widget.currentOrder <= 1
        ? widget.startAddress.latitude
        : double.parse(curLat);
    double currentLongitude = widget.currentOrder <= 1
        ? widget.startAddress.longitude
        : double.parse(curLng);

    final currentCoordinate = latlng.LatLng(currentLatitude, currentLongitude);
    _initialLocation = CameraPosition(
      target: currentCoordinate,
      zoom: 5,
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
