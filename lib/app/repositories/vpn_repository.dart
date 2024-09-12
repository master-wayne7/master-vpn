import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_vpn/app/data/models/ip_details.dart';
import 'package:master_vpn/app/data/models/vpn_info_model.dart';
import 'package:master_vpn/app/services/app_preferences.dart';
import 'package:master_vpn/app/services/dio_services.dart';
import 'package:master_vpn/app/utils/snackbar_utils.dart';

class VpnRepository {
  final Dio _dio = Get.find<DioService>().dio;

  Future<List<VpnInfoModel>> getAvailableFreeVpn() async {
    final List<VpnInfoModel> vpnList = [];
    try {
      final response = await _dio.get(
        "http://www.vpngate.net/api/iphone",
        options: Options(
          responseType: ResponseType.plain,
        ),
      );
      String csvString = response.data.split("#")[1].replaceAll("*", "");
      List<List<dynamic>> listData = const CsvToListConverter().convert(csvString);
      final head = listData[0];
      for (var i = 1; i < listData.length - 1; i++) {
        Map<String, dynamic> jsonData = {};
        for (var j = 0; j < head.length; j++) {
          jsonData[head[j].toString()] = listData[i][j];
        }
        vpnList.add(VpnInfoModel.fromMap(jsonData));
      }
    } catch (e, st) {
      debugPrint(st.toString() + e.toString());
      DialogUtil.error(msg: e.toString());
    }

    vpnList.shuffle();
    if (vpnList.isNotEmpty) AppPreferences.vpnInfoList = vpnList;

    return vpnList;
  }

  Future<void> retrieveIPDetails({required Rx<IPDetails> ipDetails}) async {
    try {
      final response = await _dio.get("http://ip-api.com/json/");
      ipDetails.value = IPDetails.fromMap(response.data);
    } catch (e) {
      DialogUtil.error(msg: e.toString());
    }
  }
}
