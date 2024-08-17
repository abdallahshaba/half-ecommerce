import 'package:e_commerce_app14/core/constant/appRouts.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController{
  checkCode();
  goToSuccessSignUp();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController{
 late String verifyCode;

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRouts.successSignUp);
  }
  
  @override
  checkCode() {
  }
  @override
  void onInit() {
    super.onInit();
  }
}
