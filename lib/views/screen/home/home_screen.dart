import 'package:e_commerce_app14/controllers/home/home_controller.dart';
import 'package:e_commerce_app14/core/class/handling_data_view.dart';
import 'package:e_commerce_app14/views/widgets/home/custom_appbar.dart';
import 'package:e_commerce_app14/views/widgets/home/custom_list_categories.dart';
import 'package:e_commerce_app14/views/widgets/home/custom_list_productForYou.dart';
import 'package:e_commerce_app14/views/widgets/home/custom_list_salling.dart';
import 'package:e_commerce_app14/views/widgets/home/custom_title.dart';
import 'package:e_commerce_app14/views/widgets/home/offers_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
      child: GetBuilder<HomeControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: const [
             CustomAppBarHomeScreen(hintText: "Find Product"),
              SizedBox(height: 15,),
              OffersWidgets(),
              SizedBox(height: 30,),
              CustomTitle(text: "Categories"),
              SizedBox(height: 10,),
              CustomListCategoriesHome(),
              SizedBox(height: 20,),
              CustomTitle(text: "Product for you"),
              SizedBox(height: 10,),
              CustomListProductForYou(),
              CustomTitle(text: "Best selling products"),
              SizedBox(height: 10,),
              CustomListBestSalling(),
            ],
          ),
        ),
      ),
    ));
  }
}