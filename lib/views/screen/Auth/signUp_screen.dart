import 'package:e_commerce_app14/controllers/Auth/signUp_controller.dart';
import 'package:e_commerce_app14/core/class/handling_data_view.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/functions/alert_exit_app.dart';
import 'package:e_commerce_app14/core/functions/valid_input.dart';
import 'package:e_commerce_app14/views/widgets/Auth/custom_appBar_Auth.dart';
import 'package:e_commerce_app14/views/widgets/Auth/custom_button_Auth.dart';
import 'package:e_commerce_app14/views/widgets/Auth/custom_textBody_Auth.dart';
import 'package:e_commerce_app14/views/widgets/Auth/custom_text_form_field_Auth.dart';
import 'package:e_commerce_app14/views/widgets/Auth/cutome_textTiltle_Auth.dart';
import 'package:e_commerce_app14/views/widgets/Auth/text_signIn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
     Get.put(SignUpControllerImp());
    return Scaffold(
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignUpControllerImp> (builder: (controller) {
          return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              color: AppColor.kBackgroundColor,
              child:  Form(
                key: controller.formstate,
                child: Column(
                  children: [
                   const SizedBox(
                      height: 50,
                    ),
                    CustomAppBarAuth(
                      text: 'Sign Up',
                      onTap: () {
                      },
                    ),
                   const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ListView(
                    padding: EdgeInsets.zero ,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomTextTitleAuth(text: "Welcome Back"),
                      const SizedBox(
                        height: 10 ,
                      ),
                      const CustomTextBodyAuth(
                          text:
                              'Sign Up with Your Email And Password OR Continue with Social Media'),
                      const SizedBox(
                        height: 30,
                      ),
                       CustomTextFormAuth(
                        isNumber: false,
                        // ignore: body_might_complete_normally_nullable
                        valid: (value) {
                          return validInput(value!, 2, 20, "username");
                        },
                        mycontroller: controller. username,
                        labeltext: "Username",
                        hinttext: 'Enter Your Username',
                        iconData:  Icons.person_search_rounded
                      ),
                      
                      const SizedBox(
                        height: 15,
                      ),
                       CustomTextFormAuth(
                        isNumber: false,
                         valid: (value) {
                          return validInput(value!, 5, 100, "email");
                        },
                        mycontroller: controller. email,
                        labeltext: "Email",
                        hinttext: 'Enter Your Email',
                        iconData: Icons.email_outlined,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                       CustomTextFormAuth(
                        isNumber: false,
                         // ignore: body_might_complete_normally_nullable
                         valid: (value) {
                          return validInput(value!, 2, 20, "password");
                        },
                        mycontroller: controller. password,
                        labeltext: "Password",
                        hinttext: 'Enter Your Password',
                        iconData: Icons.lock_outline,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                       CustomTextFormAuth(
                        isNumber: false,
                         // ignore: body_might_complete_normally_nullable
                         valid: (value) {
                          return validInput(value!, 2, 11, "phone");
                        },
                        mycontroller: controller. phone,
                        labeltext: "Phone",
                        hinttext: 'Enter Your Phone',
                        iconData: Icons.phone_android_outlined,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomButtonAuth(
                        text22: "Sign Up",
                        onPressed: () async {
                         await controller.signUp();
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                       CustomTextSignInOrSignUp(
                        onTap: () {
                          controller.goToSignIn();
                        },
                        text1: " Already have an account?",
                        text2: "  Sign In",
                      )
                    ],
                  ),
                ),
                            )
                  ],
                ),
              ),
            ),
            );
        },)
            
    
                ),
        );
  }
}
