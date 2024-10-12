import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';

class ArchiveOrdersScreen extends StatelessWidget {
  const ArchiveOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColor.kBackgroundColorMain,
        centerTitle: true,
        title:  Text("Archive Orders" , style: Styles.boldtextStyle20.copyWith(color: Colors.white),),
      ),
      backgroundColor: AppColor.kBackgroundColorMain2,
      body: ListView(

      ),
    );
  }
}