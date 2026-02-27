// import 'dart:async';
// import 'package:flutter/foundation.dart';
//
//
// import 'api_exception.dart';
// import 'dio_interceptors.dart';
//
// class DioApiService {
//   static final DioApiService _instance = DioApiService._internal();
//   factory DioApiService() => _instance;
//   DioApiService._internal();
//
//   final Dio _dio = Dio();
//
//   void initialize() {
//     _dio.options = BaseOptions(
//       baseUrl: ApiConstants.baseUrl,
//       connectTimeout: const Duration(seconds: 30),
//       receiveTimeout: const Duration(seconds: 30),
//       sendTimeout: const Duration(seconds: 30),
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//       },
//       validateStatus: (status) => true, // Accept all status codes
//     );
//     //
//
//     // Add interceptors
//     _dio.interceptors.add(DioInterceptors());
//
//
//     // Add logging for debug mode
//     if (kDebugMode) {
//       _dio.interceptors.add(PrettyDioLogger(
//         requestBody: true,
//         responseBody: true,
//         requestHeader: true,
//         compact: false,
//         error: true,
//         logPrint: (object) => MyLog.debug('DIO ${object.toString()}'),
//       ));
//     }
//   }
//
//   // Generic GET method - IMPROVED
//   Future<dynamic> get(
//     String endpoint, {
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     bool requiresAuth = true,
//   }) async {
//     try {
//       Options requestOptions = options ?? Options();
//
//       if (requiresAuth) {
//         if (!Global.isLoggedIn) {
//           Global.logoutAndRedirect();
//           throw UnauthorizedException('No access token available');
//         }
//         requestOptions.headers = {
//           ...?requestOptions.headers,
//           'Authorization': Global.authHeader,
//         };
//         print('🔐 GET Request with Bearer Token: $endpoint');
//       }
//
//       final response = await _dio.get(
//         endpoint,
//         queryParameters: queryParameters,
//         options: requestOptions,
//       );
//
//       return _processResponse(response);
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     } catch (e, stackTrace) {
//       debugPrint('UNCAUGHT ERROR: $e');
//       debugPrintStack(stackTrace: stackTrace);
//       throw ApiException('Unhandled exception: $e');
//     }
//   }
//
//   // Generic POST method - IMPROVED
//   Future<dynamic> post(
//     String endpoint, {
//     dynamic data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     bool requiresAuth = true,
//   }) async {
//     try {
//       Options requestOptions = options ?? Options();
//
//       if (requiresAuth) {
//         if (!Global.isLoggedIn) {
//           Global.logoutAndRedirect();
//           throw UnauthorizedException('No access token available');
//         }
//         requestOptions.headers = {
//           ...?requestOptions.headers,
//           'Authorization': Global.authHeader,
//         };
//         print('🔐 POST Request with Bearer Token: $endpoint');
//       }
//
//       final response = await _dio.post(
//         endpoint,
//         data: data,
//         queryParameters: queryParameters,
//         options: requestOptions,
//       );
//
//       //
//
//       return _processResponse(response);
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     } catch (e, stackTrace) {
//       debugPrint('UNCAUGHT ERROR: $e');
//       debugPrintStack(stackTrace: stackTrace);
//       throw ApiException('Unhandled exception: $e');
//     }
//   }
//
//   // Generic PUT method
//   Future<dynamic> put(String endpoint,
//       {dynamic data,
//       Map<String, dynamic>? queryParameters,
//       Options? options,
//       bool requiresAuth = true}) async {
//     try {
//       Options requestOptions = options ?? Options();
//       if (requiresAuth) {
//         if (!Global.isLoggedIn) {
//           Global.logoutAndRedirect();
//           throw UnauthorizedException('No access token available');
//         }
//         requestOptions.headers = {
//           ...?requestOptions.headers,
//           'Authorization': Global.authHeader,
//         };
//         print('🔐 POST Request with Bearer Token: $endpoint');
//       }
//
//       final response = await _dio.put(
//         endpoint,
//         data: data,
//         queryParameters: queryParameters,
//         options: requestOptions,
//       );
//
//       return _processResponse(response);
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     } catch (e, stackTrace) {
//       debugPrint('UNCAUGHT ERROR: $e');
//       debugPrintStack(stackTrace: stackTrace);
//       throw ApiException('Unhandled exception: $e');
//     }
//   }
//
//
//
//   // Generic PATCH method
//   Future<dynamic> patch(
//       String endpoint, {
//         dynamic data,
//         Map<String, dynamic>? queryParameters,
//         Options? options,
//         bool requiresAuth = true,
//       }) async {
//     try {
//       Options requestOptions = options ?? Options();
//
//       if (requiresAuth) {
//         if (!Global.isLoggedIn) {
//           Global.logoutAndRedirect();
//           throw UnauthorizedException('No access token available');
//         }
//         requestOptions.headers = {
//           ...?requestOptions.headers,
//           'Authorization': Global.authHeader,
//         };
//         print('🔐 PATCH Request with Bearer Token: $endpoint');
//       }
//
//       final response = await _dio.patch(
//         endpoint,
//         data: data,
//         queryParameters: queryParameters,
//         options: requestOptions,
//       );
//
//       return _processResponse(response);
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     } catch (e, stackTrace) {
//       debugPrint('UNCAUGHT ERROR: $e');
//       debugPrintStack(stackTrace: stackTrace);
//       throw ApiException('Unhandled exception: $e');
//     }
//   }
//
//
//   // Generic DELETE method
//   Future<dynamic> delete(
//     String endpoint, {
//     dynamic data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     bool requiresAuth = true,
//   }) async {
//     try {
//       Options requestOptions = options ?? Options();
//       if (requiresAuth) {
//         if (!Global.isLoggedIn) {
//           Global.logoutAndRedirect();
//           throw UnauthorizedException('No access token available');
//         }
//         requestOptions.headers = {
//           ...?requestOptions.headers,
//           'Authorization': Global.authHeader,
//         };
//         print('🔐 POST Request with Bearer Token: $endpoint');
//       }
//
//       final response = await _dio.delete(
//         endpoint,
//         data: data,
//         queryParameters: queryParameters,
//         options: requestOptions,
//       );
//
//       return _processResponse(response);
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     } catch (e, stackTrace) {
//       debugPrint('UNCAUGHT ERROR: $e');
//       debugPrintStack(stackTrace: stackTrace);
//       throw ApiException('Unhandled exception: $e');
//     }
//   }
//
//   // Processing the response - FIXED to handle API responses properly
//   dynamic _processResponse(Response response) {
//     // Add logging to debug response
//     debugPrint('Response Status Code: ${response.statusCode}');
//     debugPrint('Response Data: ${response.data}');
//
//     // For successful HTTP status codes, return the data as-is
//     // Let the calling code handle the API's internal status
//     if (response.statusCode != null &&
//         response.statusCode! >= 200 &&
//         response.statusCode! < 300) {
//       return response.data;
//     }
//
//     // Handle specific error cases
//     // if (response.statusCode == 401) {
//     //   // Token expired or invalid
//     //   print(' Token expired or invalid - clearing stored data');
//     //   Global.clearUserData();
//
//       if (response.data is Map) {
//         final responseData = response.data as Map;
//         if (responseData.containsKey('status') &&
//             responseData.containsKey('message')) {
//           return response.data; // Return structured error response
//         }
//       }
//
//
//     // Handle other HTTP error status codes
//     switch (response.statusCode) {
//       case 400:
//         throw BadRequestException(response.data is Map
//             ? (response.data['message'] ?? response.data.toString())
//             : response.data.toString());
//       // case 401:
//       // case 403:
//       // Global.logoutAndRedirect();
//       //   throw UnauthorizedException(response.data is Map
//       //       ? (response.data['message'] ?? response.data.toString())
//       //       : response.data.toString());
//       case 404:
//         throw NotFoundException(response.data is Map
//             ? (response.data['message'] ?? response.data.toString())
//             : response.data.toString());
//       case 500:
//       default:
//         throw ServerException(
//             'Server error occurred with status code: ${response.statusCode}');
//     }
//   }
//
//   // Handle Dio errors - IMPROVED
//   Exception _handleDioError(DioException error) {
//     debugPrint('DioException Type: ${error.type}');
//     debugPrint('DioException Message: ${error.message}');
//     debugPrint('DioException Response: ${error.response?.data}');
//
//     switch (error.type) {
//       case DioExceptionType.connectionTimeout:
//       case DioExceptionType.sendTimeout:
//       case DioExceptionType.receiveTimeout:
//         return TimeoutException('Connection timeout');
//
//       case DioExceptionType.badResponse:
//         final statusCode = error.response?.statusCode;
//         final responseData = error.response?.data;
//
//         // For OTP verification, if we get a structured response, return it
//         if (statusCode == 401 &&
//             responseData is Map &&
//             responseData.containsKey('status') &&
//             responseData.containsKey('message')) {
//           // This shouldn't throw an exception, it should return the response
//           // But since we're in error handling, we'll create a custom exception
//           throw ApiException(responseData['message'] ?? 'Invalid OTP');
//         }
//
//         switch (statusCode) {
//           case 400:
//             return BadRequestException(responseData is Map
//                 ? (responseData['message'] ?? 'Bad request')
//                 : (responseData?.toString() ?? 'Bad request'));
//           case 401:
//           case 403:
//             return UnauthorizedException(responseData is Map
//                 ? (responseData['message'] ?? 'Unauthorized')
//                 : (responseData?.toString() ?? 'Unauthorized'));
//           case 404:
//             return NotFoundException(responseData is Map
//                 ? (responseData['message'] ?? 'Not found')
//                 : (responseData?.toString() ?? 'Not found'));
//           case 500:
//           default:
//             return ServerException(responseData is Map
//                 ? (responseData['message'] ?? 'Server error: $statusCode')
//                 : 'Server error: $statusCode');
//         }
//
//       case DioExceptionType.cancel:
//         return ApiException('Request was cancelled');
//
//       case DioExceptionType.connectionError:
//         return NetworkException('No internet connection');
//
//       case DioExceptionType.unknown:
//       default:
//         return ApiException(
//             'Something went wrong: ${error.message ?? "Unknown error occurred"}');
//     }
//   }
// }
