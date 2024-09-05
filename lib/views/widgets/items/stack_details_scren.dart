import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app14/controllers/iteme/item_detai_cont.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StackDetailsScreen extends StatelessWidget {
  const StackDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
  ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());
    return  Stack(
                clipBehavior: Clip.none,
                children:[
                   Container(
                    decoration: const BoxDecoration(
                      color: AppColor.kBackgroundColorMain,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                      )
                    ),
                  height: 220,
                  
                ),
                Positioned(
                  top: 40,
                  left: Get.width/9,
                  right: Get.width/9,
                  child: SizedBox(
                    child: Hero(
                      tag: "${controller.itemsModel.itemsId}",
                      child: CachedNetworkImage(
                               imageUrl: "${AppLink.imageItems}/${controller.itemsModel.itemsImage}" , fit: BoxFit.contain , height: 250,   
                   ),
                    ), 
                  ),
                ),
                controller.itemsModel.offers != null && int.tryParse(controller.itemsModel.offers!) != 0? Positioned(
                  top: 200,
                  left: 20,
                  child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange
                  ),
                  child: Column(
                    children: [
                      Text("${controller.itemsModel.offers}%" , style: Styles.boldtextStyle20,),
                      const Text("OFF" , style: Styles.boldtextStyle20,),
                    ],
                  ),
                )
                ): const SizedBox.shrink() 
            ] 
            );
  }
}