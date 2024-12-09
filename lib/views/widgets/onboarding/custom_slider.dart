import 'package:e_commerce_app14/controllers/onBoarding_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/data/dataSource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
                itemCount: onBoardingList.length,
                itemBuilder: (context, index) => Column(
                      children: [
                        Text(
                          onBoardingList[index].title!,
                          style: Styles.boldtextStyle22,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            child: Image.asset(
                          onBoardingList[index].image!,
                          width: 400,
                          height: 350,
                          fit: BoxFit.cover,
                        )),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(onBoardingList[index].body!,
                              style: Styles.regulartextStyle18
                                  .copyWith(height: 2, color: AppColor.grey),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                    );
  }
}