import 'package:e_commerce_app14/controllers/onBoarding_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/views/widgets/onboarding/custom_buttom.dart';
import 'package:e_commerce_app14/views/widgets/onboarding/custom_slider.dart';
import 'package:e_commerce_app14/views/widgets/onboarding/dot_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const  Scaffold(
      backgroundColor: AppColor.kBackgroundColorMain4,
      body:  Column(
        children:  [
           SizedBox(
            height: 40,
          ),
          Expanded(
            flex: 3,
            child: CustomSliderOnBoarding()
          ),
           Expanded(
            flex: 1,
            child: Column(
              children: [DotControllerOnBoarding()],
            ),
          ),
           CustomButtonOnBoarding(),
           SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
