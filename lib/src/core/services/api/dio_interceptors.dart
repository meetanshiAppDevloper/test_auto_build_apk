//
// import 'package:get/get.dart' as getx;
//
//
// class DioInterceptors extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     AppLogger.d(
//         'DIO REQUEST',
//         'URL: ${options.baseUrl}${options.path}\n'
//             'METHOD: ${options.method}\n'
//             'HEADERS: ${options.headers}\n'
//             'PARAMS: ${options.queryParameters}\n'
//             'DATA: ${options.data}');
//
//     return super.onRequest(options, handler);
//   }
//
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     AppLogger.d(
//         'DIO RESPONSE',
//         'STATUS: ${response.statusCode}\n'
//             'URL: ${response.requestOptions.baseUrl}${response.requestOptions.path}\n'
//             'DATA: ${response.data}');
//
//     return super.onResponse(response, handler);
//   }
//
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     AppLogger.e(
//         'DIO ERROR',
//         'STATUS: ${err.response?.statusCode}\n'
//             'URL: ${err.requestOptions.baseUrl}${err.requestOptions.path}\n'
//             'MESSAGE: ${err.message}\n'
//             'DATA: ${err.response?.data}');
//
//     // સ્ટેપ 1: તપાસો કે તે 401 એરર છે કે નહીં
//     if (err.response?.statusCode == 401) {
//       Global.logoutAndRedirect(); // centralized
//       return; // STOP pipeline
//     }
//
//     final errorMessage = _getErrorMessage(err);
//     showCustomSnackBar(errorMessage);
//
//     return super.onError(err, handler);
//   }
//
//   bool _isTokenExpiredError(dynamic data) {
//     if (data is Map) {
//       final message = data['message'];
//       if (message is String) {
//
//         return message.toLowerCase().contains('expired');
//       }
//     }
//     return false;
//   }
//
//   void _handleUnauthorized() {
//     // આ મેથડમાં કોઈ ફેરફાર નથી
//     Global.clearUserData();
//     if (getx.Get.currentRoute != AppRoutes.login) {
//       getx.Get.offAllNamed(AppRoutes.login);
//       showCustomSnackBar('Session expired. Please login again.');
//     }
//   }
//
//
//
//   // Extract meaningful error message from DioException
//   String _getErrorMessage(DioException error) {
//     switch (error.type) {
//       case DioExceptionType.connectionTimeout:
//       case DioExceptionType.sendTimeout:
//       case DioExceptionType.receiveTimeout:
//         return 'Connection timeout. Please try again.';
//       case DioExceptionType.badResponse:
//         String? message = error.response?.data is Map
//             ? error.response?.data['message']
//             : error.response?.data.toString();
//         return message ?? 'Something went wrong';
//       case DioExceptionType.cancel:
//         return 'Request was cancelled';
//       case DioExceptionType.connectionError:
//         return 'No internet connection. Please check your network.';
//       default:
//         return 'Something went wrong';
//     }
//   }
// }
//
