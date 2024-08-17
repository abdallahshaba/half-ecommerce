import 'package:e_commerce_app14/controllers/Auth/signIn_controller.dart';
import 'package:e_commerce_app14/core/class/handling_data_view.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/imageAsset.dart';
import 'package:e_commerce_app14/core/functions/alert_exit_app.dart';
import 'package:e_commerce_app14/core/functions/check_internet.dart';
import 'package:e_commerce_app14/core/functions/valid_input.dart';
import 'package:e_commerce_app14/views/widgets/Auth/custom_appBar_Auth.dart';
import 'package:e_commerce_app14/views/widgets/Auth/custom_button_Auth.dart';
import 'package:e_commerce_app14/views/widgets/Auth/custom_textBody_Auth.dart';
import 'package:e_commerce_app14/views/widgets/Auth/custom_text_form_field_Auth.dart';
import 'package:e_commerce_app14/views/widgets/Auth/cutome_textTiltle_Auth.dart';
import 'package:e_commerce_app14/views/widgets/Auth/text_signIn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var res;

  initialData () async {
    res = await checkInternet();
    print(res);
  }

  @override
  void initState() {
    initialData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     Get.put(SignInControllerImp());
    return Scaffold(
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignInControllerImp>(builder: (controller) {
          return HandlingDataRequest(
            statusRequest: controller.statusRequest, 
            widget: Container(
            color: AppColor.kBackgroundColor,
            child: Column(
              children: [
               const SizedBox(
                  height: 50,
                ),
                CustomAppBarAuth(
                  text: "9".tr,
                  onTap: () {
                  },
                ),
               const SizedBox(
                  height: 35,
                ),
                Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Form(
                key: controller.formState,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Image.asset(
                      AppImageAsset.logo,
                      height: 180,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomTextTitleAuth(text: "Welcome Back"),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomTextBodyAuth(
                        text:
                            'Sign In with Your Email And Password OR Continue with Social Media'),
                    const SizedBox(
                      height: 30,
                    ),
                     CustomTextFormAuth(
                      isNumber: false,
                       valid: (value) {
                        return validInput(value!, 5, 100, "email");
                      },
                      mycontroller: controller.email ,
                      labeltext: "Email",
                      hinttext: 'Enter Your Email',
                      iconData: Icons.email_outlined,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GetBuilder<SignInControllerImp>(builder: (controller) =>  CustomTextFormAuth(
                      onTapIcon: () {
                        controller.showPassword();
                      },
                      obscureText: controller.isShowPassword,
                      isNumber: false,
                      valid: (value) {
                        return validInput(value!, 2, 20, "password");
                      },
                      mycontroller: controller.password ,
                      labeltext: "Password",
                      hinttext: 'Enter Your Password',
                      iconData: Icons.lock_outline,
                    ),),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        controller.goToForgetPasswordPage();
                      },
                      child: const Text(
                        "Forget Password",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Color.fromARGB(255, 142, 134, 134),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButtonAuth(
                      text22: "Sign In",
                      onPressed: () async {
                       await controller.signIn();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                     CustomTextSignInOrSignUp(
                      onTap: () {
                        controller.goToSignUpPage();
                      },
                      text1: "Don't have an account?",
                      text2: "  Sign Up",
                    )
                  ],
                ),
              ),
            ),
          )
              ],
            ),
          ),
            );
        },)
      ),

        );
  
  }
}
