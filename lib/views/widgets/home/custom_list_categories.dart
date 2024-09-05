import 'package:e_commerce_app14/controllers/home/home_controller.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/core/functions/translataDatabase.dart';
import 'package:e_commerce_app14/data/models/categories_model.dart';
import 'package:e_commerce_app14/link_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomListCategoriesHome extends GetView<HomeControllerImp> {
  const CustomListCategoriesHome({super.key});
  
  @override
  Widget build(BuildContext context) {
  HomeControllerImp controller = Get.put(HomeControllerImp());
    return SizedBox(
      height: 100,
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


class Categories extends GetView<HomeControllerImp> {
   final CategoriesModel categoriesModel;
   final int i ;
  const Categories( {super.key, required this.categoriesModel , required this.i});
 
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemsScreen(controller.categories , i , categoriesModel.categoriesId! );
      },
      child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 255, 255, 255)),
                  child: SvgPicture.network(
                      "${AppLink.imageCategories}/${categoriesModel.categoriesImage}" , color: Color.fromARGB(255, 0, 4, 48),),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
                  style: Styles.regulartextStyle14,
                )
              ],
            ),
    );
  }
}