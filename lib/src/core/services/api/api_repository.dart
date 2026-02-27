//
//
// import 'package:flutter_getx_structure/src/core/services/api/api_constants.dart';
// import 'package:flutter_getx_structure/src/core/services/api/api_exception.dart';
// import 'package:flutter_getx_structure/src/core/services/api/dio_api_service.dart';
// import 'package:flutter_getx_structure/src/utils/global.dart';
// import 'package:flutter_getx_structure/src/utils/logger.dart';
//
// class ApiRepository {
//   final DioApiService _apiService = DioApiService();
//
//   // Singleton pattern
//   static final ApiRepository _instance = ApiRepository._internal();
//
//   factory ApiRepository() => _instance;
//
//   ApiRepository._internal();
//
//   Future<Map<String, dynamic>> login(String phoneNumber) async {
//     final data = {
//       'mobile_number': phoneNumber,
//     };
//
//     try {
//       final response = await _apiService.post(
//         ApiConstants.login,
//         data: data,
//         requiresAuth: false,
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<Map<String, dynamic>> sendOtp(String phoneNumber) async {
//     final data = {
//       'mobile_number': phoneNumber,
//     };
//
//     try {
//       final response = await _apiService.post(
//         ApiConstants.sendOtp,
//         data: data,
//         requiresAuth: false,
//       );
//
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<Map<String, dynamic>> verifyOtp(String phoneNumber, String otp) async {
//     final data = {
//       'mobile_number': phoneNumber,
//       'otp': otp,
//     };
//
//     try {
//       final response = await _apiService.post(
//         ApiConstants.verifyOtp,
//         data: data,
//         requiresAuth: false,
//       );
//
//       return response;
//     } on ApiException catch (e) {
//       if (e.message.toLowerCase().contains('invalid') ||
//           e.message.toLowerCase().contains('expired') ||
//           e.message.toLowerCase().contains('otp')) {
//         return {
//           'status': false,
//           'message': e.message,
//         };
//       }
//       rethrow;
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   /// Create user profile/details
//   Future<Map<String, dynamic>> createUserProfile(UserDetailsModel userDetails,
//       {String? userImageBase64}) async {
//     // Check authentication before making request
//     if (!Global.isLoggedIn) {
//       throw UnauthorizedException('Access token required for profile creation');
//     }
//
//     final data = {
//       'first_name': userDetails.firstName,
//       'last_name': userDetails.lastName,
//       'dob': _formatDateForApi(userDetails.dob),
//       'email': userDetails.email,
//       'gender': userDetails.gender.toLowerCase(),
//       'state': userDetails.state,
//       'address_type': userDetails.addressType.toLowerCase(),
//       'house_flat_apartment': userDetails.house,
//       'area': userDetails.area,
//       'pincode': userDetails.pinCode,
//       'city': userDetails.city,
//       'mobile_number': userDetails.phoneNumber,
//     };
//
//     MyLog.info('📤 Creating user profile with Bearer Token');
//
//     try {
//       final response = await _apiService.post(
//         ApiConstants.userDetailsCreate,
//         data: data,
//         requiresAuth: true,
//       );
//
//       return response;
//     } catch (e) {
//       MyLog.error('❌ Profile creation failed: $e');
//       rethrow;
//     }
//   }
//
//   /// Get user profile/details
//   Future<Map<String, dynamic>> getUserProfile() async {
//     // Check authentication before making request
//     if (!Global.isLoggedIn) {
//       throw UnauthorizedException('Access token required to fetch profile');
//     }
//
//     MyLog.success('📤 Fetching user profile with Bearer Token');
//
//     try {
//       final response = await _apiService.get(
//         ApiConstants.getUserProfile,
//         requiresAuth: true, // This will automatically add Bearer token
//       );
//
//       MyLog.error('📥 User Profile Response: $response');
//       return response;
//     } catch (e) {
//       MyLog.error('❌ Profile fetch failed: $e');
//       rethrow;
//     }
//   }
//
//   Future<Map<String, dynamic>> updateProfileImage(String base64Image) async {
//     // Check authentication before making request
//     if (!Global.isLoggedIn) {
//       throw UnauthorizedException(
//           'Access token required for profile image update');
//     }
//
//     final data = {
//       'user_image': base64Image,
//     };
//
//     print('📤 Updating profile image with Bearer Token');
//
//     try {
//       final response = await _apiService.patch(
//         ApiConstants.userProfileImage,
//         data: data,
//         requiresAuth: true,
//       );
//
//       print('✅ Profile image updated successfully');
//       return response;
//     } catch (e) {
//       print('❌ Profile image update failed: $e');
//       rethrow;
//     }
//   }
//   //
//
//   /// Logout user
//   Future<Map<String, dynamic>> logout() async {
//     final response =
//         await _apiService.post(ApiConstants.logout, requiresAuth: true);
//     Global.clearUserData();
//     return response;
//   }
//
//   Future<BankModel?> getBankDetails() async {
//     if (!Global.isLoggedIn) {
//       throw UnauthorizedException(
//           'Access token required to fetch bank details');
//     }
//
//     MyLog.info('📤 Fetching user bank details...');
//
//     try {
//       final response = await _apiService.post(
//         ApiConstants.getBankDetails,
//         requiresAuth: true,
//         data: {}, // જો POST હોય તો ખાલી ડેટા મોકલો
//       );
//
//       if (response['status'] == true && response['bank'] != null) {
//         return BankModel.fromJson(response['bank']);
//       } else {
//         MyLog.error('❌ No bank details found in API response');
//         return null; // જો 'bank' કી ન મળે તો null રિટર્ન કરો
//       }
//     } catch (e) {
//       MyLog.error('❌ Failed to fetch bank details: $e');
//       rethrow;
//     }
//   }
//
//   Future<bool> addBankDetails(BankModel bank) async {
//     if (!Global.isLoggedIn) {
//       throw UnauthorizedException('Access token required to save bank details');
//     }
//
//     MyLog.info('📤 Saving user bank details...');
//
//     try {
//       final response = await _apiService.post(
//         ApiConstants.addBankDetails,
//         data: bank.toJson(),
//         requiresAuth: true,
//       );
//
//       return response['status'] == true;
//     } catch (e) {
//       MyLog.error('❌ Failed to save bank details: $e');
//       rethrow;
//     }
//   }
//
//   // KYC Details
//
//   Future<Map<String, dynamic>> saveKycDetails({
//     required String panFirstName,
//     required String panLastName,
//     required String pancardNumber,
//   }) async {
//     if (!Global.isLoggedIn) {
//       throw UnauthorizedException('Access token required to save KYC details');
//     }
//
//     final data = {
//       'pan_first_name': panFirstName,
//       'pan_last_name': panLastName,
//       'pancard_number': pancardNumber,
//     };
//
//     MyLog.info('📤 Saving user KYC details...');
//
//     try {
//       final response = await _apiService.post(
//         ApiConstants.addKycDetails,
//         data: data,
//         requiresAuth: true,
//       );
//
//       MyLog.success('📥 KYC details saved response: $response');
//       return response;
//     } catch (e) {
//       MyLog.error('❌ Failed to save KYC details: $e');
//       rethrow;
//     }
//   }
//
//   /// Get user's KYC Details
//
//   Future<KycDetailsModel?> getKycDetails() async {
//     if (!Global.isLoggedIn) {
//       throw UnauthorizedException('Access token required to fetch KYC details');
//     }
//
//     MyLog.info('📤 Fetching user KYC details via POST...');
//
//     try {
//       final response = await _apiService.post(
//         ApiConstants.getKycDetails,
//         requiresAuth: true,
//       );
//
//       MyLog.success('📥 Fetched KYC details response: $response');
//
//       if (response['status'] == true && response['kyc_data'] != null) {
//         return KycDetailsModel.fromJson(response['kyc_data']);
//       } else {
//         MyLog.info('📥 No KYC data found on server.');
//         return null;
//       }
//     } catch (e) {
//       MyLog.error('❌ Failed to fetch KYC details: $e');
//       rethrow;
//     }
//   }
//
//   // Transactions
//   // Future<Map<String, dynamic>> getTransactions() async {
//   //   if (!Global.isLoggedIn) {
//   //     throw UnauthorizedException(
//   //         'Access token required to fetch transactions');
//   //   }
//   //
//   //   MyLog.info('📤 Fetching user transactions...');
//   //
//   //   try {
//   //     final response = await _apiService.post(
//   //       ApiConstants.getTransactions,
//   //       requiresAuth: true,
//   //       data: {},
//   //     );
//   //
//   //     MyLog.success('📥 Fetched transactions response: $response');
//   //     return response;
//   //   } catch (e) {
//   //     MyLog.error('❌ Failed to fetch transactions: $e');
//   //     rethrow;
//   //   }
//   // }
//
//   // Gold and Sliver Buy
//
//   Future<Map<String, dynamic>> getTransactions({int page = 1}) async {
//     // page પેરામીટર ઉમેરો
//     if (!Global.isLoggedIn) {
//       throw UnauthorizedException(
//           'Access token required to fetch transactions');
//     }
//
//     MyLog.info('📤 Fetching user transactions for page: $page...');
//
//     try {
//       // API એન્ડપોઇન્ટ સાથે પેજનો નંબર ઉમેરો
//       final response = await _apiService.post(
//         '${ApiConstants.transactions}?page=$page', // અહીં ફેરફાર કર્યો છે
//         requiresAuth: true,
//         data: {},
//       );
//
//       MyLog.success('📥 Fetched transactions response: $response');
//       return response;
//     } catch (e) {
//       MyLog.error('❌ Failed to fetch transactions: $e');
//       rethrow;
//     }
//   }
//
//   Future<Map<String, dynamic>> generatePurchaseId({
//     required String type,
//     required double amount,
//     String? metalType,
//     double? weightGrams,
//     double? pricePerGram,
//   }) async {
//     if (!Global.isLoggedIn) {
//       throw UnauthorizedException('Access token required to generate ID');
//     }
//
//     final data = {
//       "type": type,
//       "amount": amount.toStringAsFixed(2),
//       "metal_type": metalType,
//       "weight_grams": weightGrams?.toStringAsFixed(4),
//       "price_per_gram": pricePerGram?.toStringAsFixed(2),
//     };
//
//     MyLog.info('📤 Generating a new purchase ID with data: $data');
//
//     try {
//       final response = await _apiService.post(
//         ApiConstants.purchaseOrderId,
//         requiresAuth: true,
//         data: data,
//       );
//       MyLog.success('📥 Purchase ID generated: $response');
//       return response;
//     } catch (e) {
//       MyLog.error('❌ Failed to generate purchase ID: $e');
//       rethrow;
//     }
//   }
//
//   Future<PurchaseMetalModel> processPurchase({
//     required String metalType,
//     required double weightGrams,
//     required double pricePerGram,
//     required double totalAmount,
//     required String paymentMethod,
//     String? razorGatewayOrderId,
//     required String purchaseNumber,
//     String? gatewayPaymentId,
//     String? razorpaySignature,
//   }) async {
//     if (!Global.isLoggedIn) {
//       throw UnauthorizedException('Access token is required for purchase.');
//     }
//
//     final data = {
//       "metal_type": metalType,
//       "purchase_number": purchaseNumber,
//       "weight_grams": weightGrams.toString(),
//       "price_per_gram": pricePerGram.toStringAsFixed(2),
//       "total_amount": totalAmount.toStringAsFixed(2),
//       "gateway_payment_id": gatewayPaymentId,
//       "payment_method": paymentMethod,
//       "gateway_order_id": razorGatewayOrderId,
//       //  "order_id": razorpayOrderId,
//       "gateway_signature": razorpaySignature,
//     };
//
//     data.removeWhere((key, value) => value == null);
//
//     MyLog.info('📤 Processing purchase with data: $data');
//
//     try {
//       final response = await _apiService.post(
//         ApiConstants.purchaseGold,
//         data: data,
//         requiresAuth: true,
//       );
//
//       MyLog.success('📥 Purchase response: $response');
//       return PurchaseMetalModel.fromJson(response);
//     } catch (e) {
//       MyLog.error('❌ Purchase failed: $e');
//       rethrow;
//     }
//   }
//
//   // Wallet Api
//
//   Future<WalletBalanceModel?> getWalletBalance() async {
//     if (!Global.isLoggedIn) {
//       throw UnauthorizedException(
//           'Access token required to fetch wallet balance');
//     }
//
//     MyLog.info('📤 Fetching wallet balance...');
//
//     try {
//       final response = await _apiService.post(
//         ApiConstants.getWalletBalance,
//         requiresAuth: true,
//         data: {},
//       );
//
//       MyLog.success('📥 Fetched wallet balance response: $response');
//
//       if (response['status'] == true && response['data'] != null) {
//         return WalletBalanceModel.fromJson(response['data']);
//       } else {
//         MyLog.info('📥 No wallet balance data found on server.');
//         return null;
//       }
//     } catch (e) {
//       MyLog.error('❌ Failed to fetch wallet balance: $e');
//       rethrow;
//     }
//   }
//
//   Future<AddWalletResponseModel?> addWalletBalance({
//     required double amount,
//     required String transactionNumber,
//     required String gatewayOrderId,
//     required String gatewayPaymentId,
//     required String gatewaySignature,
//   }) async {
//     if (!Global.isLoggedIn) {
//       throw UnauthorizedException(
//           'Access token required to add wallet balance');
//     }
//
//     // બેકએન્ડને મોકલવા માટેનો ડેટા
//     final data = {
//       'amount': amount.toStringAsFixed(2),
//       'transaction_number': transactionNumber,
//       'gateway_order_id': gatewayOrderId,
//       'gateway_payment_id': gatewayPaymentId,
//       'gateway_signature': gatewaySignature,
//     };
//
//     MyLog.info('📤 Verifying and adding wallet balance with data: $data');
//
//     try {
//       final response = await _apiService.post(
//         ApiConstants.addWalletBalance,
//         data: data,
//         requiresAuth: true,
//       );
//
//       MyLog.success('📥 Add wallet balance response: $response');
//
//       if (response['status'] == true && response['data'] != null) {
//         return AddWalletResponseModel.fromJson(response);
//       } else {
//         MyLog.info('📥 Failed to add wallet balance: ${response['message']}');
//         return AddWalletResponseModel.fromJson(response); // એરર મેસેજ માટે
//       }
//     } catch (e) {
//       MyLog.error('❌ Failed to add wallet balance: $e');
//       rethrow;
//     }
//   }
//
//   // Future<WithdrawWalletResponseModel?> withdrawWalletBalance(
//   //     double amount) async {
//   //   if (!Global.isLoggedIn) {
//   //     throw UnauthorizedException(
//   //         'Access token required to withdraw wallet balance');
//   //   }
//   //
//   //   final data = {
//   //     'amount': amount.toStringAsFixed(2),
//   //   };
//   //
//   //   MyLog.info('📤 Withdrawing wallet balance with data: $data');
//   //
//   //   try {
//   //     final response = await _apiService.post(
//   //       ApiConstants.withdrawWalletBalance,
//   //       data: data,
//   //       requiresAuth: true,
//   //     );
//   //
//   //     MyLog.success('📥 Withdraw wallet balance response: $response');
//   //
//   //     if (response['status'] == true && response['data'] != null) {
//   //       return WithdrawWalletResponseModel.fromJson(response);
//   //     } else {
//   //       MyLog.info('📥 No data found in withdraw wallet response');
//   //       return null;
//   //     }
//   //   } catch (e) {
//   //     MyLog.error('❌ Failed to withdraw wallet balance: $e');
//   //     rethrow;
//   //   }
//   // }
//
//   Future<WithdrawWalletResponseModel?> withdrawWalletBalance(
//       double amount) async {
//     if (!Global.isLoggedIn) {
//       throw UnauthorizedException(
//           'Access token required to withdraw wallet balance');
//     }
//
//     final data = {
//       'amount': amount.toStringAsFixed(2),
//     };
//
//     MyLog.info('📤 Withdrawing wallet balance with data: $data');
//
//     try {
//       final response = await _apiService.post(
//         ApiConstants.withdrawWalletBalance,
//         data: data,
//         requiresAuth: true,
//       );
//
//       MyLog.success('📥 Withdraw wallet balance response: $response');
//
//       if (response['status'] == true) {
//         return WithdrawWalletResponseModel.fromJson(response);
//       } else {
//         return WithdrawWalletResponseModel.fromJson(response);
//       }
//     } catch (e) {
//       MyLog.error('❌ Failed to withdraw wallet balance: $e');
//       rethrow;
//     }
//   }
//
//   Future<PendingWithdrawalListResponse> getPendingWithdrawals(int page) async {
//     if (!Global.isLoggedIn) {
//       throw UnauthorizedException(
//           'Access token required to fetch pending withdrawals');
//     }
//
//     MyLog.info('📤 Fetching pending withdrawals for page: $page');
//
//     try {
//       final response = await _apiService.post(
//         '${ApiConstants.pendingWithdrawRequest}?page=$page',
//         requiresAuth: true,
//         data: {},
//       );
//
//       MyLog.success('📥 Fetched pending withdrawals response: $response');
//       return PendingWithdrawalListResponse.fromJson(response);
//     } catch (e) {
//       MyLog.error('❌ Failed to fetch pending withdrawals: $e');
//       rethrow;
//     }
//   }
//
//   Future<Map<String, dynamic>> cancelWithdrawalRequest(int requestId) async {
//     if (!Global.isLoggedIn) {
//       throw UnauthorizedException('Access token required to cancel request');
//     }
//
//     MyLog.info('📤 Cancelling withdrawal request with ID: $requestId');
//
//     try {
//       final response = await _apiService.delete(
//         '${ApiConstants.cancelWithdrawRequest}/$requestId',
//         requiresAuth: true,
//       );
//
//       MyLog.success('📥 Cancel request response: $response');
//       return response;
//     } catch (e) {
//       MyLog.error('❌ Failed to cancel withdrawal request: $e');
//       rethrow;
//     }
//   }
//
//   Future<Map<String, dynamic>> getTermsAndConditions() async {
//     print('📤 Fetching terms and conditions...');
//     try {
//       final response = await _apiService.post(
//         ApiConstants.termsAndConditions,
//         requiresAuth: true,
//         data: {},
//       );
//       print('📥 Fetched terms response: $response');
//       return response;
//     } catch (e) {
//       print('❌ Failed to fetch terms: $e');
//       rethrow;
//     }
//   }
//
//   //
//
//   Future<Map<String, dynamic>> getPrivacyPolicy() async {
//     print('📤 Fetching privacy policy...');
//     try {
//       final response = await _apiService.post(
//         ApiConstants.privacyPolicy,
//         requiresAuth: true,
//         data: {},
//       );
//       print('📥 Fetched privacy policy response: $response');
//       return response;
//     } catch (e) {
//       print('❌ Failed to fetch privacy policy: $e');
//       rethrow;
//     }
//   }
//
//   Future<Map<String, dynamic>> getContactDetails() async {
//     print('📤 Fetching contact details...');
//     try {
//       // તમારા ApiConstants માંથી એન્ડપોઇન્ટનું નામ લો
//       final response = await _apiService.post(
//         ApiConstants.contactUs,
//         requiresAuth: true,
//         data: {},
//       );
//       print('📥 Fetched contact details response: $response');
//       return response;
//     } catch (e) {
//       print('❌ Failed to fetch contact details: $e');
//       rethrow;
//     }
//   }
// }
//
// /// Convert date from DD/MM/YYYY to YYYY-MM-DD format
// String _formatDateForApi(String dateString) {
//   try {
//     if (dateString.contains('/')) {
//       List<String> parts = dateString.split('/');
//       if (parts.length == 3) {
//         String day = parts[0].padLeft(2, '0');
//         String month = parts[1].padLeft(2, '0');
//         String year = parts[2];
//         return '$year-$month-$day';
//       }
//     }
//     return dateString;
//   } catch (e) {
//     return dateString;
//   }
// }
