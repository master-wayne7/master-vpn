import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_vpn/app/modules/location/controllers/location_controller.dart';
import 'package:master_vpn/app/modules/location/views/widgets/vpn_location_card.dart';
import 'package:master_vpn/app/services/responsive_size.dart';

class VpnList extends StatelessWidget {
  const VpnList({super.key});

  @override
  Widget build(BuildContext context) {
    LocationController controller = Get.find();
    return RefreshIndicator(
      displacement: 60.kh,
      color: Colors.redAccent,
      onRefresh: controller.getVpnInfo,
      child: ListView.builder(
        itemCount: controller.vpnServerList.length,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return VpnLocationCard(vpnInfo: controller.vpnServerList[index]);
        },
      ),
    );
  }
}
