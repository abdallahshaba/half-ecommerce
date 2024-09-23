import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBackgroundColorMain2,

      appBar: AppBar(
        backgroundColor: AppColor.kBackgroundColorMain,
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        title: Text("Add new address" , style: Styles.boldtextStyle20.copyWith(color: Colors.white),),
      ),
    );
  }
}