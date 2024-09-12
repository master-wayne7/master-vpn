import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:master_vpn/app/data/models/vpn_status.dart';
import 'package:master_vpn/app/modules/home/widgets/custom_round_widget.dart';
import 'package:master_vpn/app/modules/home/widgets/location_bottom_nav_bar.dart';
import 'package:master_vpn/app/modules/home/widgets/vpn_round_button.dart';
import 'package:master_vpn/app/services/app_preferences.dart';
import 'package:master_vpn/app/services/vpn_engine.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.perm_device_info,
          ),
        ),
        title: const Text('Master VPN'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.changeThemeMode(AppPreferences.isModeDark ? ThemeMode.light : ThemeMode.dark);
              AppPreferences.isModeDark = !AppPreferences.isModeDark;
            },
            icon: const Icon(
              Icons.brightness_2_outlined,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const VpnRoundButton(),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                controller.vpnInfo.value.countryLongName.isEmpty
                    ? const CustomRoundWidget(
                        title: "Location",
                        subTitle: "FREE",
                        color: Colors.redAccent,
                        icon: Icons.flag_circle,
                      )
                    : CustomRoundWidget.image(
                        title: controller.vpnInfo.value.countryLongName,
                        subTitle: "FREE",
                        color: Colors.redAccent,
                        assetName: "assets/flags/${controller.vpnInfo.value.countryShortName.toLowerCase()}.png",
                      ),
                CustomRoundWidget(
                  subTitle: "PING",
                  title: controller.vpnInfo.value.countryLongName.isEmpty ? "20 ms" : "${controller.vpnInfo.value.ping} ms",
                  color: Colors.black54,
                  icon: Icons.graphic_eq_rounded,
                ),
              ],
            ),
          ),
          StreamBuilder<VpnStatus?>(
            initialData: VpnStatus(),
            stream: VpnEngine.vpnStatusSnapshot(),
            builder: (context, snapshot) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomRoundWidget(
                    title: snapshot.data?.byteIn ?? "0 Kbps",
                    subTitle: "DOWNLOAD",
                    color: Colors.green,
                    icon: Icons.arrow_circle_down_outlined,
                  ),
                  CustomRoundWidget(
                    title: snapshot.data?.byteOut ?? "0 Kbps",
                    subTitle: "UPLOAD",
                    color: Colors.purpleAccent,
                    icon: Icons.arrow_circle_up_outlined,
                  ),
                ],
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: const LocationSelectionBottomNavBar(),
    );
  }
}
