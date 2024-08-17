import 'package:e_commerce_app14/core/constant/appRouts.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController{
  checkCode();
  goToResetPasswordScreen();
}

class VerifyCodeControllerImp extends VerifyCodeController{
 late String verifyCode;

  @override
  goToResetPasswordScreen() {
    Get.offNamed(AppRouts.resetPassword);
  }
  
  @override
  checkCode() {
  }
  @override
  void onInit() {
    super.onInit();
  }
}
