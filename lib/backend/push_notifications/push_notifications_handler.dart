import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primaryColor,
          child: Center(
            child: Image.asset(
              'assets/images/Logo_(2).png',
              width: MediaQuery.of(context).size.width * 0.7,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'PasswordUpdated': (data) async => PasswordUpdatedWidget(),
  'SetNewPassword': (data) async => SetNewPasswordWidget(),
  'Verification': (data) async => VerificationWidget(),
  'Login': (data) async => LoginWidget(),
  'Register': (data) async => RegisterWidget(),
  'VerificationCode': (data) async => VerificationCodeWidget(),
  'Profile': (data) async => NavBarPage(initialPage: 'Profile'),
  'PackageReceive': (data) async => PackageReceiveWidget(),
  'TransferPackage-2': (data) async => TransferPackage2Widget(),
  'PackageDamaged': (data) async => PackageDamagedWidget(),
  'PackageDamagedPicture': (data) async => PackageDamagedPictureWidget(),
  'PackageStage': (data) async => PackageStageWidget(),
  'TransferCode': (data) async => TransferCodeWidget(),
  'TransferSucessfull': (data) async => TransferSucessfullWidget(),
  'TransferScanPackage': (data) async => TransferScanPackageWidget(),
  'PackageDetails': (data) async => PackageDetailsWidget(
        packageId: getParameter(data, 'packageId'),
      ),
  'InitiateTransfer': (data) async => InitiateTransferWidget(),
  'TransferToCarrier': (data) async => TransferToCarrierWidget(),
  'TransferReason': (data) async => TransferReasonWidget(),
  'ShowRoutes': (data) async => ShowRoutesWidget(),
  'Deliveries': (data) async => NavBarPage(initialPage: 'Deliveries'),
  'IntercomSupport': (data) async => NavBarPage(initialPage: 'IntercomSupport'),
  'SuccessDeliver': (data) async => SuccessDeliverWidget(),
  'LocatePackage': (data) async => LocatePackageWidget(),
  'UnableToDeliver': (data) async => UnableToDeliverWidget(),
  'RoutesComplete': (data) async => RoutesCompleteWidget(),
  'ShowNextStop': (data) async => ShowNextStopWidget(),
  'ShowAllRoutes': (data) async => ShowAllRoutesWidget(),
  'ScanDeliverPackage': (data) async => ScanDeliverPackageWidget(),
  'DeliverPackage': (data) async => DeliverPackageWidget(),
  'BeginRoute': (data) async => BeginRouteWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
