class ApiConstants {
  // Base URL
  // static const String baseUrl = 'https://lara.meetanshi.work/GoldApp/api';

  static const String baseUrl = 'https://lara.meetanshi.work/GoldApp/api';

  // Authentication endpoints
  static const String login = '/login';
  static const String sendOtp = '/resendotp';
  static const String verifyOtp = '/verify-otp';
  static const String userDetailsCreate = '/user-profile';
  static const String getUserProfile = '/user-detail';
  static const String refreshToken = '/auth/refresh';
  static const String logout = '/logout';

  // profile image :
  static const String userProfileImage = '/profile_image_update';

  // Bank Details Api :
  static const String addBankDetails = '/bank/add';
  static const String getBankDetails = '/bank/get';

  // Kyc Details :

  static const String addKycDetails = '/kyc/add';
  static const String getKycDetails = '/kyc/get';

// Transactions History
  static const String getTransactions = '/transactions';

  // Create Gold And Sliver Buy :
  static const String purchaseGold = '/purchase/verify-payment';
  static const String purchaseOrderId = '/generate/order';

  // Wallet
  static const String getWalletBalance = '/wallet/get';
  static const String addWalletBalance = '/wallet/add';
  static const String withdrawWalletBalance = '/withdraw/requests';
  static const String pendingWithdrawRequest = '/withdraw/list';
  static const String cancelWithdrawRequest = '/withdraw/cancel';

  // transactions
  static const String transactions = '/transactions';

  // Privacy Policy
  static const String privacyPolicy = '/privacy-policy';
  static const String termsAndConditions = '/terms-and-conditions';
  static const String contactUs = '/contactus';
}
