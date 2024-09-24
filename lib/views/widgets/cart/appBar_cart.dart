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

    return  Container(
                  alignment: Alignment.center,
                  child: const Row(
                    children: [
      
              // Expanded(
              //   child: Container(
              //     alignment: Alignment.centerLeft,
              //     child: IconButton(
              //       onPressed: () {
              //         Get.back();
              //         controller.refersh();
              //       },
              //       icon: const Icon(Icons.arrow_back),
              //     ),
              //   ),
              // ),

              Expanded(child: Optiontwo())
              ]
              )
              );
  }
}


class Optiontwo extends StatelessWidget {
  const Optiontwo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.kBackgroundColorMain2,
      centerTitle: true,
      title: Text("Cart" , style: Styles.boldtextStyle24,),
    );
  }
}