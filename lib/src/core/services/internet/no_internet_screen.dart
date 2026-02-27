// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_getx_structure/src/utils/color_utils.dart';
//
//
// class NoInternetScreen extends StatelessWidget {
//   const NoInternetScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle.dark.copyWith(
//         statusBarColor: AppColors.secondary,
//         statusBarIconBrightness: Brightness.light,
//       ),
//       child: WillPopScope(
//         onWillPop: () => AppDialogs.showExitConfirmationDialog(context),
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Lottie.asset(Assets.noInternetAnimation),
//               const SizedBox(height: Dimensions.paddingSizeDefault),
//               Center(
//                 child: Text(
//                   'No Internet Connection',
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
