import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:jeropay/screens/account/account_screen.dart';
import 'package:jeropay/screens/account/bindings/account_bindings.dart';
import 'package:jeropay/screens/airtime/airtime_screen.dart';
import 'package:jeropay/screens/airtime/bindings/airtime_bindings.dart';
import 'package:jeropay/screens/bulk_sms_screen/bindings/bulk_sms_bindings.dart';
import 'package:jeropay/screens/bulk_sms_screen/bulk_sms_screen.dart';
import 'package:jeropay/screens/cable_screen/bindings/cable_bindings.dart';
import 'package:jeropay/screens/cable_screen/cable_screen.dart';
import 'package:jeropay/screens/data/bindings/data_bindings.dart';
import 'package:jeropay/screens/data/data_screen.dart';
import 'package:jeropay/screens/edu_pins_screen/bindings/edu_pins_bindings.dart';
import 'package:jeropay/screens/edu_pins_screen/edu_pin_screen.dart';
import 'package:jeropay/screens/electricity_screen/bindings/electricity_bindings.dart';
import 'package:jeropay/screens/electricity_screen/electricity_screen.dart';
import 'package:jeropay/screens/home_screen/bindings.dart/home_screen_bindings.dart';
import 'package:jeropay/screens/home_screen/home_screen.dart';
import 'package:jeropay/screens/hotel_suite_screen/bindings/hotel_suite_bindings.dart';
import 'package:jeropay/screens/hotel_suite_screen/hotel_suite_screen.dart';
import 'package:jeropay/screens/main_screen/main_screen.dart';
import 'package:jeropay/screens/security/reset_pin.dart';
import 'package:jeropay/screens/signin/bindings/signin_bindings.dart';
import 'package:jeropay/screens/signin/signin_screen.dart';
import 'package:jeropay/screens/signup_screen/bindings/signup_bindings.dart';
import 'package:jeropay/screens/signup_screen/signup_screen.dart';
import 'package:jeropay/screens/splash_screen/splash_screen.dart';
import 'package:jeropay/screens/supplimetary_screens/app_security_screen.dart';
import 'package:jeropay/screens/supplimetary_screens/transaction_pin_screen.dart';
import 'package:jeropay/screens/transaction/bindings/transaction_bindings.dart';
import 'package:jeropay/screens/transaction/transaction_screen.dart';
import 'package:jeropay/screens/transfer_screen/bindings/transfer_bindings.dart';
import 'package:jeropay/screens/transfer_screen/transfer_screen.dart';
import 'package:jeropay/screens/community_screen/community_screen.dart';
import 'package:jeropay/screens/community_screen/community_controller.dart';
import 'package:jeropay/screens/wallet_history/bindings/wallet_bindings.dart';
import 'package:jeropay/screens/wallet_history/wallet_history.dart';
// import 'package:jara_market/screens/add_money_screen/add_money_screen.dart';
// import 'package:jara_market/screens/add_money_screen/bindings/add_money_bindings.dart';
// import 'package:jara_market/screens/browse_screen/bindings/browse_bindings.dart';
// import 'package:jara_market/screens/browse_screen/browse_screen.dart';
// import 'package:jara_market/screens/cart_screen/bindings/cart_bindings.dart';
// import 'package:jara_market/screens/cart_screen/cart_screen.dart';
// import 'package:jara_market/screens/categories_screen/bindings/categories_bindings.dart';
// import 'package:jara_market/screens/categories_screen/categories_screen.dart';
// import 'package:jara_market/screens/category_screen/bindings/category_bindings.dart';
// import 'package:jara_market/screens/category_screen/category_screen.dart';
// import 'package:jara_market/screens/checkout_address_change/bindings/checkout_address_change_binding.dart';
// import 'package:jara_market/screens/checkout_address_change/checkout_address_change.dart';
// import 'package:jara_market/screens/contact_screen/bindings/contact_bindings.dart';
// import 'package:jara_market/screens/contact_screen/contact_screen.dart';
// import 'package:jara_market/screens/egusi_soup_detail_screen/egusi_soup_detail_screen.dart';
// import 'package:jara_market/screens/email_verification/bindings/email_verification_bindings.dart';
// import 'package:jara_market/screens/email_verification/email_verification.dart';
// import 'package:jara_market/screens/faq_screen/bindings/faq_bindings.dart';
// import 'package:jara_market/screens/faq_screen/faq_screen.dart';
// import 'package:jara_market/screens/favorites_screen/bindings/favorites_bindings.dart';
// import 'package:jara_market/screens/favorites_screen/favorites_screen.dart';
// import 'package:jara_market/screens/forget_password_screen/bindings/forget_password_bindings.dart';
// import 'package:jara_market/screens/forget_password_screen/forget_password_screen.dart';
// import 'package:jara_market/screens/grains_detailed_screen/bindings/grains_detailed_bindings.dart';
// import 'package:jara_market/screens/grains_detailed_screen/grains_detailed_screen.dart';
// import 'package:jara_market/screens/grains_screen/bindings/grains_bindings.dart';
// import 'package:jara_market/screens/grains_screen/grains_screen.dart';
// import 'package:jara_market/screens/home_screen/bindings/home_bindings.dart';
// import 'package:jara_market/screens/home_screen/home_screen.dart';
// import 'package:jara_market/screens/legal/privacy_policy_screen.dart';
// import 'package:jara_market/screens/legal/terms_of_service_screen.dart';
// import 'package:jara_market/screens/login%20email_verification/bindings/email_verification_bindings.dart';
// import 'package:jara_market/screens/login%20email_verification/login_email_verification.dart';
// import 'package:jara_market/screens/login_screen/bindings/login_bindings.dart';
// import 'package:jara_market/screens/login_screen/login_screen.dart';
// import 'package:jara_market/screens/main_screen/bindings/main_bindings.dart';
// import 'package:jara_market/screens/main_screen/main_screen.dart';
// import 'package:jara_market/screens/new_password_screen/bindings/new_password_bindings.dart';
// import 'package:jara_market/screens/new_password_screen/new_password_screen.dart';
// import 'package:jara_market/screens/order_details_screen/order_details_screen.dart';
// import 'package:jara_market/screens/order_history_screen/bindings/order_history_bindings.dart';
// import 'package:jara_market/screens/order_history_screen/order_history_screen.dart';
// import 'package:jara_market/screens/order_receipt_screen/order_receipt_screen.dart';
// import 'package:jara_market/screens/order_summary_screen/order_summary_screen.dart';
// import 'package:jara_market/screens/order_tracking_screen/order_tracking_screen.dart';
// import 'package:jara_market/screens/otp_verification/otp_verification.dart';
// import 'package:jara_market/screens/product_detail_screen/bindings/product_detail_bindings.dart';
// import 'package:jara_market/screens/product_detail_screen/product_detail_screen.dart';
// import 'package:jara_market/screens/recipe_detail_screen/bindings/recipe_detail_bindings.dart';
// import 'package:jara_market/screens/recipe_detail_screen/recipe_detail_screen.dart';
// import 'package:jara_market/screens/referral_screen/bindings/referral_bindings.dart';
// import 'package:jara_market/screens/referral_screen/referral_screen.dart';
// import 'package:jara_market/screens/signup_screen/bindings/signup_bindings.dart';
// import 'package:jara_market/screens/signup_screen/signup_screen.dart';
// import 'package:jara_market/screens/soup_list_screen/soup_list_screen.dart';
// import 'package:jara_market/screens/splash/onboarding_screen.dart';
// import 'package:jara_market/screens/splash/splash_screen.dart';
// import 'package:jara_market/screens/success_screen/bindings/success_bindings.dart';
// import 'package:jara_market/screens/success_screen/success_screen.dart';
// import 'package:jara_market/screens/summary_home_screen/bindings/summary_home_bindings.dart';
// import 'package:jara_market/screens/summary_home_screen/summary_home_screen.dart';
// import 'package:jara_market/screens/user_orders_screen/bindings/user_orders_bindings.dart';
// import 'package:jara_market/screens/user_orders_screen/user_orders_screen.dart';
// import 'package:jara_market/screens/wallet_screen/bindings/wallet_bindings.dart';
// import 'package:jara_market/screens/wallet_screen/wallet_screen.dart';
// import 'package:jara_market/widgets/payment_method_card.dart';

class AppRoutes {
  static const addMoneyScreen = '/add_money_screen';
  static const resetPinWithPassword = '/reset_pin_with_password';
  static const homeScreen = '/home_screen';
  static const loginScreen = '/signin_screen';
  static const mainScreen = '/main_screen';
  static const newPasswordScreen = '/new_password_screen';
  static const orderDetailsScreen = '/order_details_screen';
  static const orderHistoryScreen = '/order_history_screen';
  static const orderReceiptScreen = '/order_receipt_screen';
  static const transactionPin = '/transaction_pin_screen';
  
  static const airtimeScreen = '/airtime_screen';
  static const dataScreen = '/data_screen';
  static const cableScreen = '/cable_screen';
  static const electricityScreen = '/electricity_screen';
  static const bulkSmsScreen = '/bulk_sms_screen';
  static const eduPinsScreen = '/edu_pins_screen';
  static const transferScreen = '/transfer_screen';
  static const hotelSuiteScreen = '/hotel_suite_screen';

  static const oTPVerificationScreen = '/oTP_verification_screen';
  static const paymentMethodScreen = '/payment_method_screen';
  
  
  static const referralScreen = '/referral_screen';
  static const signupScreen = '/signup_screen';
  
  static const splashScreen = '/splash_screen';
  static const onboardingScreen = '/onboarding_screen';
  static const appSecurityScreen = '/app_security_screen';
  static const transactionScreen = '/transaction_screen';
  static const accountScreen = '/account_screen';


  static const walletHistoryScreen = '/wallet_history_screen';
  static const privacyPolicyScreen = '/privacy_policy_screen';
  static const termsOfServiceScreen = '/terms_of_service_screen';
  

  static List<GetPage> pages = [
    GetPage(name: resetPinWithPassword,
    page: () =>  ResetPin(),
   ),
    
    GetPage(
        name: transactionScreen,
        page: () => const TransactionScreen(),
        bindings: [TransactionBindings()]),

    GetPage(
        name: airtimeScreen,
        page: () => const AirtimeScreen(),
        bindings: [AirtimeBindings()]),    
    
    GetPage(
      name: dataScreen,
      page: () => const DataScreen(),
      bindings: [DataBindings()],
    ),

    GetPage(
      name: cableScreen,
      page: () => const CableScreen(),
      bindings: [CableBindings()],
    ),

    GetPage(
      name: electricityScreen,
      page: () => const ElectricityScreen(),
      bindings: [ElectricityBindings()],
    ),

    GetPage(
      name: bulkSmsScreen,
      page: () => const BulkSmsScreen(),
      bindings: [BulkSmsBindings()],
    ),

    GetPage(
      name: eduPinsScreen,
      page: () => const EduPinScreen(),
      bindings: [EduPinsBindings()],
    ),

    GetPage(
      name: transferScreen,
      page: () => const TransferScreen(),
      bindings: [TransferBindings()],
    ),

    GetPage(
      name: '/community_screen',
      page: () => const CommunityScreen(),
      binding: BindingsBuilder(() => Get.lazyPut(() => CommunityController())),
    ),

    GetPage(
      name: hotelSuiteScreen,
      page: () => const HotelSuiteScreen(),
      bindings: [HotelSuiteBindings()],
    ),

    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      bindings: [HomeScreenBindings()],
    ),
    GetPage(
      name: loginScreen,
      page: () => const SigninScreen(),
      bindings: [SigninBindings()],
    ),
    GetPage(
        name: transactionPin,
        page: () => const TransactionPinScreen(),
        ),
    GetPage(
        name: appSecurityScreen,
        page: () => const AppSecurityScreen()),
        
    // GetPage(
    //     name: orderHistoryScreen,
    //     page: () => OrderHistoryScreen(),
    //     bindings: [OrderHistoryBindings()]),
    // GetPage(
    //     name: productDetailScreen,
    //     page: () => const ProductDetailScreen(),
    //     bindings: [ProductDetailBindings()]),
    // GetPage(
    //     name: recipeDetailScreen,
    //     page: () => const RecipeDetailScreen(),
    //     bindings: [RecipeDetailBindings()]),
    // GetPage(
    //     name: referralScreen,
    //     page: () => const ReferralScreen(),
    //     bindings: [ReferralBindings()]),
    GetPage(
        name: signupScreen,
        page: () => const SignupScreen(),
        bindings: [SignupBindings()]),
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: mainScreen,
      page: () => const MainScreen(),
    ),
    // GetPage(
    //     name: successScreen,
    //     page: () => const SuccessScreen(),
    //     bindings: [SuccessBindings()]),
    GetPage(
        name: accountScreen,
        page: () => const AccountScreen(),
        bindings: [AccountBindings()]),
    GetPage(
      name: walletHistoryScreen,
      page: () => const WalletHistoryScreen(),
      bindings: [WalletBindings()],
    ),
    // GetPage(
    //   name: privacyPolicyScreen,
    //   page: () => const PrivacyPolicyScreen(),
    // ),
    // GetPage(
    //     name: termsOfServiceScreen, page: () => const TermsOfServiceScreen()),

    //     GetPage(
    //       name: emailVerificationScreen,
    //       page: () => const EmailVerificationScreen(),
    //       bindings: [EmailVerificationBindings()]
    //     ),
    //     GetPage(
    //       name: loginEmailVerification,
    //       page: () => const LoginEmailVerification(),
    //       bindings: [LoginEmailVerificationBindings()]
    //     ),

        
  ];
}
