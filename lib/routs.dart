import 'package:e_commerce_app14/core/constant/appRouts.dart';
// import 'package:e_commerce_app14/core/middleware/my_middleware.dart';
//import 'package:e_commerce_app14/test.dart';
import 'package:e_commerce_app14/text_Packeages.dart';
import 'package:e_commerce_app14/views/address/add_address.dart';
import 'package:e_commerce_app14/views/address/edite_address.dart';
import 'package:e_commerce_app14/views/address/view_address.dart';
import 'package:e_commerce_app14/views/offers/offers_screen.dart';
import 'package:e_commerce_app14/views/screen/Auth/forget_password_screen.dart';
import 'package:e_commerce_app14/views/screen/Auth/resetPassword_screen.dart';
import 'package:e_commerce_app14/views/screen/Auth/signUp_screen.dart';
import 'package:e_commerce_app14/views/screen/Auth/signin_screen.dart';
import 'package:e_commerce_app14/views/screen/Auth/success_reset_password.dart';
import 'package:e_commerce_app14/views/screen/Auth/success_signUp.dart';
import 'package:e_commerce_app14/views/screen/Auth/verifyCode_signUp_screen.dart';
import 'package:e_commerce_app14/views/screen/Auth/verifycode_screen.dart';
import 'package:e_commerce_app14/views/screen/cart/cart_screen.dart';
import 'package:e_commerce_app14/views/screen/checkout/checkout_screen.dart';
import 'package:e_commerce_app14/views/screen/favorite/favorite_scre.dart';
import 'package:e_commerce_app14/views/screen/home/general_home.dart';
import 'package:e_commerce_app14/views/screen/items/items_screnn.dart';
import 'package:e_commerce_app14/views/screen/items_details/items_detiel_scre.dart';
import 'package:e_commerce_app14/views/screen/language/language_screen.dart';
import 'package:e_commerce_app14/views/screen/onBoarding/onBoarding_screen.dart';
import 'package:e_commerce_app14/views/screen/orders/archieve.dart';
import 'package:e_commerce_app14/views/screen/orders/order_details.dart';
import 'package:e_commerce_app14/views/screen/orders/pending.dart';
import 'package:e_commerce_app14/views/screen/settings/setting_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';



List<GetPage<dynamic>>? routes = [
  // GetPage(name: "/", page: () =>  SplashScreen()),
  //GetPage(name: "/", page: () => const TestPages()),
   GetPage(name: "/", page: () => const LanguageScreen(),  ),
  GetPage(name: AppRouts.signIn, page: () => const SignInScreen()),
  GetPage(name: AppRouts.signUp, page: () => const SignUpScreen()),
  GetPage(name: AppRouts.forgetPassword, page: () => const ForgerPasswordScreen()),
  GetPage(name: AppRouts.resetPassword, page: () => const ResetPasswordScreen()),
  GetPage(name: AppRouts.verifyCode, page: () => const VerifyCodeScreen()),
  GetPage(name: AppRouts.successResetPassword, page: () => const SuccessResetPasswordScreen()),
  GetPage(name: AppRouts.successSignUp, page: () => const SuccessSignUpScreen()),
  GetPage(name: AppRouts.verifyCodeSignUp, page: () => const VerifyCodeSignUpScreen()),
  GetPage(name: AppRouts.onBoarding, page: () => const OnBoardingScreen()),
  GetPage(name: AppRouts.cartScreen, page: () => const CartScreen()),

  GetPage(name: AppRouts.testPakeages, page: () => const TestPakeages()),
  //============================ Home ===================================
  GetPage(name: AppRouts.homeScreen, page: () => const HomeGeneral()),
  GetPage(name: AppRouts.homeGeneral, page: () => const HomeGeneral()),
  GetPage(name: AppRouts.settingsScreen, page: () => const SettingsScreen()),

//============================ items ===================================
  GetPage(name: AppRouts.itemsScreen, page: () => const ItemsScreen()),
  GetPage(name: AppRouts.itemsDetailsScreen, page: () => const ItemDetailsScreen()),

  //============================ items ===================================
  GetPage(name: AppRouts.favoriteScreen, page: () => const FavoriteScreen()),


    //============================ address ===================================
  GetPage(name: AppRouts.addressView, page: () => const ViewAdderssScreen()),
  GetPage(name: AppRouts.addressAdd, page: () => const AddAddressScreen()),
  GetPage(name: AppRouts.addressEdite, page: () => const EditAddressScreen()),

    //============================ address ===================================
  GetPage(name: AppRouts.checkOut, page: () => const CheckOutScreen()),


    //============================ orders ===================================
  GetPage(name: AppRouts.pendingOreders, page: () => const PendingOrdersScreen()),
  GetPage(name: AppRouts.archiveOreders, page: () => const ArchiveOrdersScreen()),
  GetPage(name: AppRouts.orderDetails, page: () => const OrderDetailsScteen()),

  GetPage(name: AppRouts.offersScreen, page: () => const OffersScreen()),


];