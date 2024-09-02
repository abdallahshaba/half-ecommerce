import 'package:e_commerce_app14/controllers/home/home_controller.dart';
import 'package:e_commerce_app14/controllers/iteme/item_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/data/models/categories_model.dart';
import 'package:e_commerce_app14/link_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategoriesItemPage extends GetView<ItemsControllerImp> {
  const CategoriesItemPage({super.key});
  
  @override
  Widget build(BuildContext context) {
  HomeControllerImp controller = Get.put(HomeControllerImp());
    return SizedBox(
      height: 27,
      width: 140,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return  Categories(
            i : index ,
            categoriesModel: CategoriesModel.fromJson(controller.categories[index]),);
        },
      ),
    );
  }
}


class Categories extends GetView<ItemsControllerImp> {
   final CategoriesModel categoriesModel;
   final int i ;
  const Categories( {super.key, required this.categoriesModel , required this.i});
 
  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return GetBuilder<ItemsControllerImp>(builder:(controller) => InkWell(
      onTap: () {
        controller.changeCat(i);
      },
      child: Container(
        decoration: BoxDecoration(
          border: controller.selectedCat==i? const Border(
            bottom: BorderSide(width: 3 , color: AppColor.kBackgroundColorMain)
          ) : null,
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: SizedBox(
                  child: Text("${categoriesModel.categoriesName}"),),
              ),
                SizedBox(
                  width: 30,
                  child: SvgPicture.network("${AppLink.imageCategories}/${categoriesModel.categoriesImage}"))
            ],
          ),
        ),
      )
    ),);
  }
}