import 'package:e_commerce_app14/controllers/Auth/forget_password_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/core/functions/valid_input.dart';
import 'package:e_commerce_app14/views/widgets/Auth/custom_button_Auth.dart';
import 'package:e_commerce_app14/views/widgets/Auth/custom_textBody_Auth.dart';
import 'package:e_commerce_app14/views/widgets/Auth/custom_text_form_field_Auth.dart';
import 'package:e_commerce_app14/views/widgets/Auth/cutome_textTiltle_Auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgerPasswordScreen extends StatelessWidget {
  const ForgerPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
   ForgetPaswwordControllerImp controller = Get.put(ForgetPaswwordControllerImp());
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
          children:  [
             Text(
               "Forget Password",
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
              child: Form(
                key: controller.formState,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomTextTitleAuth(text: "Chech Email"),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomTextBodyAuth(
                        text:
                            'Please Enter Your Email Address To Recive A Verification Code'),
                    const SizedBox(
                      height: 30,
                    ),       
                     CustomTextFormAuth(
                      isNumber: false,
                       // ignore: body_might_complete_normally_nullable
                       valid: (value) {
                        return validInput(value!, 5, 100, "email");
                      },
                      mycontroller: controller.email,
                      labeltext: "Email",
                      hinttext: 'Enter Your Email',
                      iconData: Icons.email_outlined,
                    ),
                    
                    const SizedBox(
                      height: 35,
                    ),
                    CustomButtonAuth(
                      text22: "Check",
                      onPressed: () {
                        controller.goToVerifyCode();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
