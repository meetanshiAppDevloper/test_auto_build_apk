import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_structure/src/utils/color_utils.dart';
import 'package:get/get.dart';

class AppToast {
  static void _show({
    required BuildContext context,
    required String title,
    String? message,
    required CherryToastType type,
    Position position = Position.bottom,
    Duration duration = const Duration(seconds: 3),
    AnimationType? animation,
  }) {
    final textStyle =
        const TextStyle(color: Colors.white, fontWeight: FontWeight.w600);

    final effectiveAnimation = animation ??
        switch (position) {
          Position.top => AnimationType.fromRight,
          Position.bottom => AnimationType.fromRight,
          Position.center => AnimationType.fromLeft,
        };

    final icon = switch (type) {
      CherryToastType.success =>
        const Icon(Icons.check_circle, color: Colors.white),
      CherryToastType.error => const Icon(Icons.error, color: Colors.white),
      CherryToastType.warning => const Icon(Icons.warning, color: Colors.white),
    };

    final toast = switch (type) {
      CherryToastType.success => CherryToast.success,
      CherryToastType.error => CherryToast.error,
      CherryToastType.warning => CherryToast.warning,
    };

    toast(
      title: Text(title, style: textStyle),
      description: message != null ? Text(message, style: textStyle) : null,
      backgroundColor: switch (type) {
        CherryToastType.success => AppColors.primary,
        CherryToastType.error => AppColors.primary,
        CherryToastType.warning => AppColors.primary,
      },
      iconWidget: icon,
      borderRadius: 10,
      displayCloseButton: false,
      toastPosition: position,
      toastDuration: duration,
      animationType: effectiveAnimation,
      animationDuration: const Duration(milliseconds: 800),
    ).show(context);
  }

  static void success(
    BuildContext context,
    String title, [
    String? message,
    Position position = Position.bottom,
    AnimationType? animation,
    Duration duration = const Duration(seconds: 3),
  ]) =>
      _show(
        context: context,
        title: title,
        message: message,
        type: CherryToastType.success,
        position: position,
        animation: animation,
        duration: duration,
      );

  static void error(
    BuildContext context,
    String title, {
    String? message,
    Position position = Position.bottom,
    AnimationType? animation,
    Duration duration = const Duration(seconds: 3),
  }) =>
      _show(
        context: context,
        title: title,
        message: message,
        type: CherryToastType.error,
        position: position,
        animation: animation,
        duration: duration,
      );

  static void warning(
    BuildContext context,
    String title, [
    String? message,
    Position position = Position.bottom,
    AnimationType? animation,
    Duration duration = const Duration(seconds: 3),
  ]) =>
      _show(
        context: context,
        title: title,
        message: message,
        type: CherryToastType.warning,
        position: position,
        animation: animation,
        duration: duration,
      );
}

enum CherryToastType { success, error, warning }

void showCustomSnackBar(String message, {bool isError = true}) {
  Get.snackbar(
    isError ? 'Error' : 'Success',
    message,
    backgroundColor: isError ? Colors.red : Colors.green,
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(milliseconds: 1500),
    margin: const EdgeInsets.all(10),
    borderRadius: 10,
  );
}
