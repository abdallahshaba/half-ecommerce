import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CutomButtonLanguage extends StatelessWidget {
  const CutomButtonLanguage({super.key, required this.textName, this.onPressed});
 final String textName;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
                onPressed: onPressed,
                textColor: Colors.white,
                color: AppColor.kBackgroundColorMain,
                child:  Text(
                  textName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              );
  }
}