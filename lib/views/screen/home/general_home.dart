import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce_app14/controllers/home/general_home_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/imageAsset.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeGeneral extends StatefulWidget {
  const HomeGeneral({super.key});

  @override
  State<HomeGeneral> createState() => _HomeGeneralState();
}

class _HomeGeneralState extends State<HomeGeneral> {
  @override
  Widget build(BuildContext context) {
    Get.put(GeneralHomeControllerImp());
    return GetBuilder<GeneralHomeControllerImp>(builder:(controller) => Scaffold(
      backgroundColor: AppColor.kBackgroundColorMain2,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 6),
      //   child: FloatingActionButton(
      //     backgroundColor: AppColor.kPrimaryColor,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(100)
      //     )  ,
      //     onPressed: (){} , child: const Icon(Icons.shopping_basket_sharp , color: Colors.white,),),
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: AppColor.kBackgroundColorMain,
        height: 60,
        onTap: (value) {
          controller.changePage(value);
        },
        items:  [
          Icon(Icons.home , size: 30 , color: Colors.white,),
          Icon(Icons.settings , size: 30 , color: Colors.white,),
          Icon(CupertinoIcons.profile_circled , size: 30 , color: Colors.white,),
          Container(
            height: 45,
            child: Lottie.asset(AppImageAsset.offers , width: 300 , height: 300,))
        ],
      ),
      body: WillPopScope(child: controller.listPages.elementAt(controller.currentPage), 
      onWillPop: (){
        Get.defaultDialog(
          title: "Warning" , 
          middleText: "Do you want to exit tha app" , 
          titleStyle: Styles.boldtextStyle16,
          onConfirm: (){exit(0);},
          onCancel: () {
            
          },
          );
        return Future.value(false);
      }
      )
    ),
    );
  }
}