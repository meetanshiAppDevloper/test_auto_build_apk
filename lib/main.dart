import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_structure/src/app/routes/app_pages.dart';
import 'package:flutter_getx_structure/src/app/routes/app_routes.dart';
import 'package:flutter_getx_structure/src/controllers/theme/theme_controller.dart';
import 'package:flutter_getx_structure/src/theme/dark_theme.dart';
import 'package:flutter_getx_structure/src/theme/light_theme.dart';
import 'package:flutter_getx_structure/src/utils/color_utils.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  //await GetStorage.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return Obx(
      () => GetMaterialApp(
        title: 'Flutter Getx Structure',
        debugShowCheckedModeBanner: false,
        themeMode:
            themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        theme: LightTheme.getThemeData(AppColors.primary, AppColors.secondary),
        darkTheme:
            DarkTheme.getThemeData(AppColors.primary, AppColors.secondary),
        initialRoute: AppRoutes.splash,
        getPages: AppPages.pages,
      ),
    );
  }
}
