// import 'dart:async';
// import 'package:get/get.dart';
//
//
// class ConnectivityService {
//   static final ConnectivityService _instance = ConnectivityService._internal();
//
//   factory ConnectivityService() => _instance;
//
//   ConnectivityService._internal();
//
//   late StreamSubscription<List<ConnectivityResult>> _subscription;
//
//   void initialize() {
//     _subscription = Connectivity()
//         .onConnectivityChanged
//         .listen((List<ConnectivityResult> results) {
//       bool isConnected = results.contains(ConnectivityResult.wifi) ||
//           results.contains(ConnectivityResult.mobile);
//       _showToast(isConnected);
//     });
//   }
//
//   void _showToast(bool isConnected) {
//     final context = Get.context;
//     if (context == null) return;
//
//     if (isConnected) {
//       //  AppToast.success(context, 'You are back online');
//
//       if (Get.currentRoute == '/internetLost') {
//         Get.back();
//       }
//     } else {
//       AppToast.error(context, "No internet connection");
//
//       if (Get.currentRoute != '/internetLost') {
//         Get.toNamed('/internetLost');
//       }
//     }
//   }
//
//   void dispose() {
//     _subscription.cancel();
//   }
// }
