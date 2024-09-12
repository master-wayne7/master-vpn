import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_vpn/app/data/models/vpn_config.dart';
import 'package:master_vpn/app/data/models/vpn_info_model.dart';
import 'package:master_vpn/app/services/app_preferences.dart';
import 'package:master_vpn/app/services/vpn_engine.dart';
import 'package:master_vpn/app/utils/snackbar_utils.dart';

class HomeController extends GetxController {
  final Rx<VpnInfoModel> vpnInfo = AppPreferences.vpnInfo.obs;

  final RxString vpnConnectionState = VpnEngine.vpnDisconnected.obs;

  void connectToVpn() async {
    if (vpnInfo.value.base64OpenVPNConfigurationData.isEmpty) {
      DialogUtil.error(msg: "Please select country / location first");
      return;
    }
    if (vpnConnectionState.value == VpnEngine.vpnDisconnected) {
      final dataVpn = const Base64Decoder().convert(vpnInfo.value.base64OpenVPNConfigurationData);
      final config = const Utf8Decoder().convert(dataVpn);
      final vpnConfig = VpnConfig(
        username: "vpn",
        password: "vpn",
        countryName: vpnInfo.value.countryLongName,
        config: config,
      );

      await VpnEngine.startVpn(vpnConfig);
    } else {
      VpnEngine.stopVpn();
    }
  }

  Color get getButtonColor {
    switch (vpnConnectionState.value) {
      case VpnEngine.vpnDisconnected:
        return Colors.red;
      case VpnEngine.vpnConnected:
        return Colors.green;
      default:
        return Colors.orangeAccent;
    }
  }

  String get getButtonText {
    switch (vpnConnectionState.value) {
      case VpnEngine.vpnDisconnected:
        return "Tap to connect";
      case VpnEngine.vpnConnected:
        return "Disconnect";
      default:
        return "Connecting...";
    }
  }
}
