import 'package:anandmart_driver/screen/profile_screen.dart';
import 'package:anandmart_driver/screen/salary_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../authentication/email_verification_screen.dart';
import '../authentication/login_screen.dart';
import '../authentication/onboarding_screen.dart';
import '../authentication/otpScreen.dart';
import '../authentication/signupScreen.dart';
import '../screen/splash_screen.dart';
import '../screen/assigned_order.dart';
import '../screen/bank_details.dart';
import '../screen/delivery_partner_apply.dart';
import '../screen/deshborad_screen.dart';
import '../screen/order_details.dart';
import '../screen/order_history.dart';
import '../screen/thank_you.dart';
import '../screen/withdraw_money.dart';



class MyRouters {
  static var splashScreen = "/splashScreen";
  // static var onBoardingScreen = "/onBoardingScreen";
  static var loginScreen = "/loginScreen";
  static var signupScreen = "/signupScreen";
  static var otpScreen = "/otpScreen";
  static var emailVerificationScreen = "/emailVerificationScreen";
  static var thankYouVendorScreen = "/thankYouVendorScreen";
  // static var deliveryPartnerApplyScreen = "/deliveryPartnerApplyScreen";
  static var dashbordScreen = "/dashbordScreen";
  static var assignedOrderScreen = "/assignedOrderScreen";
  static var bankDetailsScreen = "/bankDetailsScreen";
  static var driverWithdrawMoney = "/driverWithdrawMoney";
  static var driverDeliveryOrderDetails = "/driverDeliveryOrderDetails";
  static var profileScreen = "/profileScreen";
  static var onBoardingScreen = "/onBoardingScreen";
  static var salaryScreen = "/salaryScreen";

  static var route = [
    GetPage(name: '/', page: () =>  const SplashScreen()),
    // GetPage(name: '/onBoardingScreen', page: () =>  const OnBoardingScreen()),
    GetPage(name: '/onBoardingScreen', page: () =>  const OnBoardingScreen()),
    GetPage(name: '/loginScreen', page: () => const LoginScreenMart()),
    GetPage(name: '/salaryScreen', page: () => const SalaryScreen()),
    GetPage(name: '/signupScreen', page: () => const SignupScreen()),
    GetPage(name: '/otpScreen', page: () => const OtpScreen()),
    GetPage(name: '/otpScreen', page: () => const OtpScreen()),
    GetPage(name: '/emailVerificationScreen', page: () => const EmailVerificationScreen()),
    GetPage(name: '/thankYouVendorScreen', page: () => const ThankYouVendorScreen()),
    GetPage(name: DeliveryPartnerApplyScreen.deliveryPartnerApplyScreen, page: () => const DeliveryPartnerApplyScreen()),
    GetPage(name: ThankYouVendorScreen.thankYouVendorScreen, page: () => const ThankYouVendorScreen()),
    GetPage(name: '/dashbordScreen', page: () => const DashbordScreen()),
    GetPage(name: '/assignedOrderScreen', page: () => const AssignedOrderScreen()),
    GetPage(name: '/bankDetailsScreen', page: () => const BankDetailsScreen()),
    GetPage(name: '/driverWithdrawMoney', page: () => const DriverWithdrawMoney()),
    GetPage(name: '/driverDeliveryOrderDetails', page: () => const DriverDeliveryOrderDetails()),
    GetPage(name: '/profileScreen', page: () => const ProfileScreen()),
    GetPage(name: OrderHistory.orderHistory, page: () => const OrderHistory()),



  ];
}