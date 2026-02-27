import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimensions {
  // Responsive font sizes
  static double get fontSizeExtraSmall => _isLargeScreen ? 14 : 10;
  static double get fontSizeSmall => _isLargeScreen ? 16 : 12;
  static double get fontSizeDefault => _isLargeScreen ? 18 : 14;
  static double get fontSizeLarge => _isLargeScreen ? 20 : 16;
  static double get fontSizeExtraLarge => _isLargeScreen ? 22 : 18;
  static double get fontSizeExtraLarge1 => _isLargeScreen ? 24 : 20;
  static double get fontSizeOverLarge => _isLargeScreen ? 28 : 24;

  // Padding constants
  static const double paddingSizeTiny = 3.0;
  static const double paddingSizeExtraSmall = 5.0;
  static const double paddingSizeSeven = 7.0;
  static const double paddingSizeSmall = 10.0;
  static const double paddingSize = 12.0;
  static const double paddingSizeDefault = 15.0;
  static const double paddingSizeLarge = 20.0;
  static const double paddingSize22 = 22.0;

  static const double paddingSizeExtraLarge = 25.0;
  static const double paddingSizeOverLarge = 30.0;
  static const double paddingSizeSignUp = 35.0;
  static const double paddingSizeSignUpMax = 40.0;
  static const double paddingSizeOver = 50.0;
  static const double paddingSizeOverMax = 70.0;
  static const double paddingSizeOver74 = 74.0;
  static const double paddingSizeOverExtra = 80.0;

  // Radius constants
  static const double radiusSmall = 8.0;
  static const double radiusDefault = 10.0;
  static const double radiusLarge = 16.0;
  static const double radiusExtraLarge = 20.0;
  static const double radiusOver = 25.0;
  static const double radiusOverLarge = 30.0;

  static const SizedBox heightBoxSmall = SizedBox(height: 10.0);
  static const SizedBox heightBoxDefault = SizedBox(height: 15.0);
  static const SizedBox heightBoxLarge = SizedBox(height: 20.0);

  // Sizes
  static const double webMaxWidth = 1170;
  static const double identityImageWidth = 130;
  static const double identityImageHeight = 80;

  // AppBar
  static const double appBarHeight = 250;
  static const double androidAppBarHeight = 200;

  // Icons
  static const double iconSizeSmall = 15;
  static const double iconSizeMedium = 20;
  static const double iconSizeLarge = 25;
  static const double iconSizeExtraLarge = 30;
  static const double iconSizeDoubleExtraLarge = 40;
  static const double iconSizeDialog = 60;
  static const double iconSizeOnline = 100;
  static const double iconSizeOffline = 50;

  // RTL / LTR support
  static double get headerCardHeight =>
      Get.locale?.languageCode == 'ar' ? 53 : 45;

  // Determine if screen is large
  static bool get _isLargeScreen =>
      Get.context?.width != null && Get.context!.width >= 1300;
}
