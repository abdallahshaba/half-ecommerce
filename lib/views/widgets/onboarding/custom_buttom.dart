import 'package:e_commerce_app14/controllers/onBoarding_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
                onPressed: (){
                  controller.next();
                },
                padding: const EdgeInsets.symmetric(horizontal: 120 , vertical: 10),
                textColor: Colors.white,
                color: AppColor.kPrimaryColor,
                child:  Text('8'.tr , style: Styles.boldtextStyle18,),
                );
  }
}