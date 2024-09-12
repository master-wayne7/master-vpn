import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUtil {
  static success({required String msg}) {
    Get.closeAllSnackbars();
    Get.snackbar(
      'Success',
      msg,
      colorText: Colors.white,
      backgroundColor: Colors.green.withOpacity(.9),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static error({required String msg}) {
    Get.closeAllSnackbars();
    Get.snackbar(
      'Error',
      msg,
      colorText: Colors.white,
      backgroundColor: Colors.redAccent.withOpacity(.9),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static info({required String msg}) {
    Get.closeAllSnackbars();
    Get.snackbar(
      'Info',
      msg,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static showProgress() {
    Get.dialog(const Center(child: CircularProgressIndicator(strokeWidth: 2)));
  }
}
