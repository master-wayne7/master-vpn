import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:master_vpn/app/data/models/vpn_config.dart';
import 'package:master_vpn/app/data/models/vpn_status.dart';

class VpnEngine {
  ///Channel to native
  static const String _eventChannelVpnStage = "vpnStage";
  static const String _eventChannelVpnStatus = "vpnStatus";
  static const String _methodChannelVpnControl = "vpnControl";

  ///Snapshot of VPN Connection Stage
  Stream<String> vpnStageSnapshot() => const EventChannel(_eventChannelVpnStage).receiveBroadcastStream().cast();

  ///Snapshot of VPN Connection Status
  Stream<VpnStatus?> vpnStatusSnapshot() => const EventChannel(_eventChannelVpnStatus).receiveBroadcastStream().map((event) => VpnStatus.fromJson(jsonDecode(event))).cast();

  ///Start VPN easily
  Future<void> startVpn(VpnConfig vpnConfig) async {
    log(vpnConfig.config);
    return const MethodChannel(_methodChannelVpnControl).invokeMethod(
      "start",
      {
        "config": vpnConfig.config,
        "country": vpnConfig.countryName,
        "username": vpnConfig.username,
        "password": vpnConfig.password,
      },
    );
  }

  ///Stop vpn
  Future<void> stopVpn() => const MethodChannel(_methodChannelVpnControl).invokeMethod("stop");

  ///Open VPN Settings
  Future<void> openKillSwitch() => const MethodChannel(_methodChannelVpnControl).invokeMethod("kill_switch");

  ///Trigger native to get stage connection
  Future<void> refreshStage() => const MethodChannel(_methodChannelVpnControl).invokeMethod("refresh");

  ///Get latest stage
  Future<String?> stage() => const MethodChannel(_methodChannelVpnControl).invokeMethod("stage");

  ///Check if vpn is connected
  Future<bool> isConnected() => stage().then((value) => value?.toLowerCase() == "connected");

  ///All Stages of connection
  static const String vpnConnected = "connected";
  static const String vpnDisconnected = "disconnected";
  static const String vpnWaitConnection = "wait_connection";
  static const String vpnAuthenticating = "authenticating";
  static const String vpnReconnect = "reconnect";
  static const String vpnNoConnection = "no_connection";
  static const String vpnConnecting = "connecting";
  static const String vpnPrepare = "prepare";
  static const String vpnDenied = "denied";
}
