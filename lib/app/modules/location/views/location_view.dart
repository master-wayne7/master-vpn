import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_vpn/app/modules/location/views/widgets/vpn_list.dart';
import '../controllers/location_controller.dart';

class LocationView extends GetView<LocationController> {
  const LocationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Obx(() => Text('VPN Locations ${controller.vpnServerList.length}')),
        centerTitle: false,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? _buildLoadingWidget()
            : controller.vpnServerList.isEmpty
                ? _buildEmptyWidget()
                : const VpnList(),
      ),
    );
  }

  _buildLoadingWidget() {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }

  _buildEmptyWidget() {
    return const Center(
      child: Text("No VPN server found😢"),
    );
  }
}
