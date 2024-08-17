import 'package:e_commerce_app14/core/constant/appRouts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
 late TextEditingController password;
 late TextEditingController repassword;

  resetPassword();
  goToSuccessResetPasswordScreen();
}

class ResetPasswordControllerImp extends ForgetPasswordController {
  @override
  goToSuccessResetPasswordScreen() {
    Get.offNamed(AppRouts.successResetPassword);
  }

  @override
  resetPassword() {}
  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();

  }
  
  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    
    super.dispose();
  }
}
