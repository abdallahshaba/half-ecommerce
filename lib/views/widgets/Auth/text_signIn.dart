import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextSignInOrSignUp extends StatelessWidget {
  const CustomTextSignInOrSignUp({super.key, this.onTap, required this.text1, required this.text2});
  final Function()? onTap;
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return   Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   InkWell(
                    child: Text(text1 , style: Styles.regulartextStyle16.copyWith(fontWeight: FontWeight.normal),),
                   ),
                    InkWell(
                      onTap: onTap,
                    child: Text(text2 , style: Styles.regulartextStyle16.copyWith(fontWeight: FontWeight.bold,color: AppColor.kPrimaryColor),),
                   ),
                 ],
               );
  }
}