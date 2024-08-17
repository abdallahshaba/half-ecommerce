import 'package:e_commerce_app14/controllers/Auth/success_signup_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/imageAsset.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/views/widgets/Auth/custom_Button_Auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SuccessSignUpScreen extends StatelessWidget {
  const SuccessSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller = Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColor.kBackgroundColor,
        elevation: 0.0,
        title: const Text("Success" , style: Styles.boldtextStyle22,),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 90,),
            Center(child: Lottie.asset(AppImageAsset.success, height: 220, width: 300),),
           const Text("Done" , style: Styles.boldtextStyle24,),
           const Spacer(),
             Container(
              width: double.infinity,
               child: CustomButtonAuth(
                      text22: "Go To Sign In",
                      onPressed: () {
                        controller.goToSignInPage();
                      },
                    ),
             ),

                 const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}