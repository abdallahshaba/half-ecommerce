import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';

class OffersWidgets extends StatelessWidget {
  const OffersWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          decoration: BoxDecoration(
              color: AppColor.kBackgroundColorMain,
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Summer Surprise..",
                style: Styles.boldtextStyle18.copyWith(color: Colors.white),
              ),
            ),
            subtitle: Text(
              "Cashback 30%",
              style: Styles.boldtextStyle26.copyWith(color: Colors.white),
            ),
          ),
        ),
        Positioned(
          left: 250,
          bottom: 10,
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color:const Color.fromARGB(255, 116, 124, 211)),
          ),
        )
      ],
    );
  }
}
