
// ignore_for_file: file_names

import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/imageAsset.dart';
import 'package:e_commerce_app14/views/screen/cart/cart_screen.dart';
import 'package:e_commerce_app14/views/screen/favorite/favorite_scre.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 10 , left: 15),
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min, 
        crossAxisAlignment: CrossAxisAlignment.center, 
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.sort,
              size: 40,
              color: AppColor.kBackgroundColorMain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
              height: 40,
              child: Image.asset(
                AppImageAsset.appLogo33,
                  fit: BoxFit.fill,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Badge(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.only(left: 4 , right: 3),
              
              largeSize: 20,
              child: InkWell(
                onTap: () {
                  Get.to(const FavoriteScreen() , transition: Transition.fade);
                },
                child: const Padding(
                  padding:  EdgeInsets.only(right: 5),
                  child: Icon(Icons.favorite,size: 32,color: AppColor.kBackgroundColorMain,),
                ),
                ),
            ),
          ),
          InkWell(
                onTap: () {
                 Get.to(
                 const CartScreen(),
                 arguments: true, // تم فتح الصفحة من الهوم
                 transition: Transition.downToUp,
);
                },
                child: const Padding(
                  padding:  EdgeInsets.only(right: 5),
                  child: Icon(Icons.shopping_cart,size: 32,color: AppColor.kBackgroundColorMain,),
                ),
                ),
        ],
      ) ,
      );
  }
}