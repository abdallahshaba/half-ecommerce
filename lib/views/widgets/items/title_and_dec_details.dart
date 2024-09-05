import 'package:e_commerce_app14/controllers/iteme/item_detai_cont.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleAndDecAndColorDerailsScreen extends StatelessWidget {
  const TitleAndDecAndColorDerailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(ItemDetailsControllerImp());
    return GetBuilder<ItemDetailsControllerImp>(builder:(controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("${controller.itemsModel.itemsName}" , style: Styles.boldtextStyle22,),
              const SizedBox(height: 10,),
            Text("${controller.itemsModel.itemsDesc}" , style: Styles.boldtextStyle16.copyWith(color: Colors.grey[700]),),
             const SizedBox(height: 20,),
             const Text("Color" , style: Styles.boldtextStyle16,),
             const SizedBox(height: 5,),
             Row(
               children: [
                ...List.generate(controller.subTitle.length, (index) => InkWell(
                  onTap: () {
                   controller.subTitle[index]['active'] = controller.subTitle[index]['active'] == "0" ? "1" : "0";
                    controller.changItem(index.toString()); 
                    controller.update();  
                  } ,
                  child: Container(
                    width: 70,
                    height: 25,
                    margin: const EdgeInsets.only(right: 7),
                    decoration: BoxDecoration(
                      color: controller.subTitle[index]['active']=="1"? AppColor.kBackgroundColorMain : AppColor.kBackgroundColorMain2,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColor.kBackgroundColorMain),
                    ),
                    child:  Center(child: Text("${controller.subTitle[index]['name']}" , style: Styles.boldtextStyle14.copyWith(color: controller.subTitle[index]['active']=="1"? Colors.white : Colors.black),)),
                   ),
                ),)
               ],
             ),
            const SizedBox(height: 20,),
            const Text("Count" , style: Styles.boldtextStyle16,)
              ],
              ),
            ),);
  }
}