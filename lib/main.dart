import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:master_vpn/app/controllers/connectivity_provider.dart';
import 'package:master_vpn/app/services/app_preferences.dart';
import 'package:master_vpn/app/services/dio_services.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.initHive();
  Get.put(ConnectivityProvider());
  Get.put(DioService());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData.light(useMaterial3: true),
      themeMode: AppPreferences.isModeDark ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
    ),
  );
}
