import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  const CustomTextTitleAuth({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Text(text , style: Styles.boldtextStyle28, textAlign: TextAlign.center,);
  }
}