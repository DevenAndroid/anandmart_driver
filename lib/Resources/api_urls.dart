
class ApiUrl {
  static const baseUrl = "https://anadmart.eoxyslive.com/api/";
  static const loginApi = "${baseUrl}login";
  static const registrationApi = "${baseUrl}register";
  static const verifyOtpOfMart = "${baseUrl}verify-otp";
  static const verifyOtpForLoginOfMart = "${baseUrl}verify-email-otp";
  static const resendOtpOfMart = "${baseUrl}resend-otp";
  static const resetPasswordOfMart = "${baseUrl}reset-password";
  static const changePasswordOfMart = "${baseUrl}change-password";
  static const forgotPasswordUrl = "${baseUrl}forgot-password";
  static const resendApi = "${baseUrl}resend-otp";
  static const driverRegisterUrl = "${baseUrl}driver-register";
  static const driverInfoUrl = "${baseUrl}driver-information";
  static const updateProfileUrl = "${baseUrl}driver-update-profile";
  static const socialLoginUrl = "${baseUrl}social-login";
  static const dashBoardUrl = "${baseUrl}driver-dashboard";

}

// getHeaders() async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   final headers = {
//     HttpHeaders.contentTypeHeader: 'application/json',
//     HttpHeaders.acceptHeader: 'application/json',
//     if (pref.getString('user_info') != null)
//       HttpHeaders.authorizationHeader:
//       'Bearer ${ModelVerifyOtp.fromJson(jsonDecode(pref.getString('user_info')!)).authToken}'
//   };
//   return headers;
// }
//
//
// Future<String> getUserId() async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   ModelVerifyOtp? user =
//   ModelVerifyOtp.fromJson(jsonDecode(pref.getString('user_info')!));
//   return user.data!.id.toString();
// }
