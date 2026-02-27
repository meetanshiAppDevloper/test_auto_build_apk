import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Global {
  static const String _isLoginKey = 'isUserLoggedIn';

  static final GetStorage _box = GetStorage();

  static bool get isLoggedIn => _box.read<bool>(_isLoginKey) ?? false;

  static Future<void> saveLoginState() async {
    await _box.write(_isLoginKey, true);
  }

  static Future<void> clearLoginState() async {
    await _box.remove(_isLoginKey);
  }

  static void showErrorSnackbar(String message) {
    Get.snackbar(
      'An Error Occurred',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
