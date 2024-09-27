import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';

class PaymentMethodCheckOut extends StatelessWidget {
  const PaymentMethodCheckOut({super.key, required this.title, required this.isActive});
  final String title;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: isActive==true? Border.all(
                      width: 1.5, color: AppColor.kBackgroundColorMain) : Border.all(
                      width: 1.5, color: Colors.white) ,
                  color: Colors.white),
              child: Text(title,
                  style: Styles.boldtextStyle16
                      .copyWith(color: isActive==true? AppColor.kBackgroundColorMain : Colors.black)),
            );
  }
}