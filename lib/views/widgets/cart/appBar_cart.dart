import 'package:e_commerce_app14/controllers/iteme/item_detai_cont.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarCart extends GetView<ItemDetailsControllerImp> {
  const AppBarCart({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {

    return   AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: AppColor.kBackgroundColorMain,
          title: Text(title , style: Styles.boldtextStyle22.copyWith(color: Colors.white),),
        );
  }
}