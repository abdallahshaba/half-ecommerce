import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';

class ButtomNavigationDetailsScreen extends StatelessWidget {
  const ButtomNavigationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
        height: 45,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          color: AppColor.kBackgroundColorMain,
          onPressed: (){} , child:  Text("Add to card" , style: Styles.boldtextStyle16.copyWith(color: Colors.white),),),
      );
  }
}