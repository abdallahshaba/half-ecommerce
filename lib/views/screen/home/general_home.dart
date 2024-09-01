import 'package:e_commerce_app14/controllers/home/general_home_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/views/widgets/home/custom_buttomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: FloatingActionButton(
          backgroundColor: AppColor.kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100)
          )  ,
          onPressed: (){} , child: const Icon(Icons.shopping_basket_sharp , color: Colors.white,),),
      ),
      bottomNavigationBar: const CutomeButtomNavigationBar2(),
      body: controller.listPages.elementAt(controller.currentPage)
    ),
    );
  }
}