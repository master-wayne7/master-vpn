import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: const Center(
        child: Text(
          'LocationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
