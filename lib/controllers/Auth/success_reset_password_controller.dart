import 'package:e_commerce_app14/core/constant/appRouts.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController{
  goToSignInPage();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController{
  @override
  goToSignInPage() {
    Get.offAllNamed(AppRouts.signIn);
  }

}