import 'package:get/get.dart';
import 'package:master_vpn/app/data/models/vpn_info_model.dart';
import 'package:master_vpn/app/repositories/vpn_repository.dart';
import 'package:master_vpn/app/services/app_preferences.dart';

class LocationController extends GetxController {
  RxList<VpnInfoModel> vpnServerList = <VpnInfoModel>[].obs;
  VpnRepository repository = VpnRepository();

  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    vpnServerList.value = AppPreferences.vpnInfoList;
    if (vpnServerList.isEmpty) {
      getVpnInfo();
    }
    super.onInit();
  }

  Future<void> getVpnInfo() async {
    isLoading.value = true;
    vpnServerList.clear();
    vpnServerList.value = await repository.getAvailableFreeVpn();
    isLoading.value = false;
  }
}
