import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:master_vpn/app/data/models/vpn_info_model.dart';

class AppPreferences {
  static late Box boxOfData;

  static Future<void> initHive() async {
    await Hive.initFlutter();
    boxOfData = await Hive.openBox('data');
  }

  // setting user theme choice
  static bool get isModeDark => boxOfData.get("isModeDark") ?? false;
  static set isModeDark(bool val) => boxOfData.put("isModeDark", val);

  // for saving selected vpn
  static VpnInfoModel get vpnInfo => VpnInfoModel.fromJson(boxOfData.get("vpn") ?? "{}");
  static set vpnInfo(VpnInfoModel data) => boxOfData.put("vpn", data.toJson());

  // for all the data
  static List<VpnInfoModel> get vpnInfoList {
    List<VpnInfoModel> vpnList = [];
    final String? dataVpnString = boxOfData.get("vpnList");
    if (dataVpnString != null && dataVpnString.isNotEmpty) {
      final List<dynamic> dataVpn = jsonDecode(dataVpnString);
      for (var data in dataVpn) {
        if (data is Map<String, dynamic>) {
          vpnList.add(VpnInfoModel.fromMap(data));
        }
      }
    }

    return vpnList;
  }

  static set vpnInfoList(List<VpnInfoModel> listData) {
    final String jsonList = jsonEncode(listData.map((e) => e.toJson()).toList());
    boxOfData.put("vpnList", jsonList);
  }
}
