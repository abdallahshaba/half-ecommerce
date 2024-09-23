import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';

class CustomButtonCoupon extends StatelessWidget {
  const CustomButtonCoupon({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
                          onPressed: onPressed, 
                          color: AppColor.kBackgroundColorMain,
                          child: Text("Apply" , style: Styles.boldtextStyle16.copyWith(color: Colors.white),),
                          );
  }
}