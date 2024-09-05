import 'package:e_commerce_app14/controllers/iteme/item_controller.dart';
import 'package:e_commerce_app14/core/class/handling_data_view.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/imageAsset.dart';
import 'package:e_commerce_app14/views/widgets/home/Home_2/custom_home_textFiels.dart';
import 'package:e_commerce_app14/views/widgets/items/categories_itemPage.dart';
import 'package:e_commerce_app14/views/widgets/items/gride_view_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
  Get.put(ItemsControllerImp());
    return Scaffold(
      backgroundColor: AppColor.kBackgroundColorMain2,
      body: Padding(
        padding: const EdgeInsets.only(top: 5 , left: 20 , right: 20),
        child:  ListView(
          children: [
            SizedBox(
              height: 100,
              child: Row(
                children: [
                 const Expanded(child: CustomHomeTextFiled(color: Colors.white,)) , 
                 const SizedBox(width: 10,),
                  SizedBox(
                    height: 50,
                    child: Image.asset(AppImageAsset.appLogoSign))
                ],
              ),
            ),
           const SizedBox(height: 5,),
           const CategoriesItemPage(),
           const SizedBox(height: 20,),
          GetBuilder<ItemsControllerImp>(builder:(controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
             widget:  const GridViewItems())
             ,)
          ],
        ),
          ),);
  }
}