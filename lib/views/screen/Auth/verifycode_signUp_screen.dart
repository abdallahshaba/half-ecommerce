import 'package:e_commerce_app14/controllers/Auth/verifycode_sign_up_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/views/widgets/Auth/custom_textBody_Auth.dart';
import 'package:e_commerce_app14/views/widgets/Auth/cutome_textTiltle_Auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeSignUpScreen extends StatelessWidget {
  const VerifyCodeSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    VerifyCodeSignUpControllerImp controller = Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColor.kBackgroundColor,
            child: const Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Verification Code",
                      style: Styles.boldtextStyle20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomTextTitleAuth(text: "Check Code"),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomTextBodyAuth(
                      text:
                          'Please Enter The Digit Code Sent To abdallahshaban200@gmail.com'),
                  const SizedBox(
                    height: 30,
                  ),
                  OtpTextField(
                    fieldWidth: 50,
                    borderRadius: BorderRadius.circular(15),
                    numberOfFields: 5,
                    borderColor: const Color(0xFF512DA8),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      controller.goToSuccessSignUp();
                    }, // end onSubmit
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
