import 'package:get/get.dart';

import '../controllers/location_controller.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.find<LocationController>();
  }
}
