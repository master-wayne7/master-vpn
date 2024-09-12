import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ConnectivityProvider extends GetxController {
  final Connectivity _connectivity = Connectivity();
  final RxBool _isOnline = false.obs;
  RxBool get isOnline => _isOnline;

  @override
  void onInit() {
    startMonitoring();
    super.onInit();
  }

  void startMonitoring() async {
    await initConnectivity();
    _connectivity.onConnectivityChanged.listen((result) async {
      if (result.contains(ConnectivityResult.none)) {
        _isOnline.value = false;
      } else {
        await _updateConnectionStatus().then((bool isConnected) {
          _isOnline.value = isConnected;
        });
      }
    });
  }

  Future<void> initConnectivity() async {
    try {
      var status = await _connectivity.checkConnectivity();
      if (status.contains(ConnectivityResult.none)) {
        _isOnline.value = false;
      } else {
        _isOnline.value = true;
      }
    } on PlatformException {}
  }

  Future<bool> check() async {
    var connectivityResult = await (_connectivity.checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    }
    return false;
  }

  Future<bool> _updateConnectionStatus() async {
    bool isConnected = false;
    try {
      final List<InternetAddress> result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return isConnected = true;
      }
    } on SocketException catch (_) {
      return isConnected = false;
    }
    return isConnected;
  }
}
