import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:master_v_p_n/app/modules/home/widgets/location_bottom_nav_bar.dart';
import 'package:master_v_p_n/app/services/app_preferences.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: const Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: LocationSelectionBottomNavBar(),
    );
  }
}
