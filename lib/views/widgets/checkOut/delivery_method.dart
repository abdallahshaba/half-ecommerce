import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';

class DeliveryMethodCheckOut extends StatelessWidget {
  const DeliveryMethodCheckOut({super.key, required this.urL, required this.title, required this.isActive});
  final String urL;
  final String title;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.5, color: isActive==true? AppColor.kBackgroundColorMain : Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Image.asset(
                        urL,
                      ),
                    ),
                   const SizedBox(
                      height: 5,
                    ),
                    Text(title,style: Styles.boldtextStyle16.copyWith(color: isActive==true? AppColor.kBackgroundColorMain :Colors.black),
                    )
                  ],
                );
  }
}