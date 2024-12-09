import 'package:e_commerce_app14/controllers/onBoarding_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/data/dataSource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DotControllerOnBoarding extends StatelessWidget {
  const DotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
     builder: (controller) => Container(
      padding: const EdgeInsets.only(top: 40),
       child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             ...List.generate(
                            onBoardingList.length, (index) => AnimatedContainer(
                              margin: const EdgeInsets.only(right: 5),
                              height: 6,
                              width: controller.currentPage == index ? 20 : 5,
                              decoration: BoxDecoration(
                                color: AppColor.kBackgroundColorMain,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              duration: const Duration(milliseconds: 500),
                              ),
                              )
                          ],
                         ),
     ),
    );
  }
}