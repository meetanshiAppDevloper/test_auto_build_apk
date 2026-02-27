import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _key = 'isDarkMode';

  final _box = GetStorage();

  var isDarkMode = false.obs;

  bool _loadThemeFromBox() => _box.read<bool>(_key) ?? false;

  Future<void> _saveThemeToBox(bool isDark) => _box.write(_key, isDark);

  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = _loadThemeFromBox();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    _saveThemeToBox(isDarkMode.value);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
