import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _address = prefs.getString('ff_address') ?? _address;
  }

  late SharedPreferences prefs;

  String barcodeResult = '';

  String OTP = '';

  String email = '';

  List<String> articleTitle = [];

  bool fullArticleList = true;

  List<String> tempList = [];

  bool isContains = false;

  bool IsPacakges = true;

  bool isOTP = false;

  List<String> PacakagesList = [];

  bool showFullList = true;

  bool isDark = false;

  String downloadURl = '';

  bool isURL = false;

  bool isGenerated = true;

  double ratingStars = 0.0;

  List<dynamic> deliveryData = [];

  String currentRouteId = '';

  int currentPackageOrder = 0;

  String packageAddress = '';

  int packageCount = 0;

  String currentPackageId = '';

  String packageType = '';

  String carrierPackageId = '';

  int leftPackageCount = 0;

  int undeliverablePackageCount = 0;

  bool isDeliverablePackage = false;

  String userPhone = '';

  bool isLoaded = false;

  String _address = '';
  String get address => _address;
  set address(String _value) {
    _address = _value;
    prefs.setString('ff_address', _value);
  }

  bool isAnyPackage = false;

  String routeDistance = '';

  String routeDuration = '';

  List<String> geoCodeList = [];

  String currentPos = '';

  LatLng? startAddress = LatLng(19.4326077, -99.133208);

  LatLng? packageGeoCode = LatLng(19.4326077, -99.133208);

  String damagePackageId = '';

  bool isReceving = false;

  String receiverName = '';
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
