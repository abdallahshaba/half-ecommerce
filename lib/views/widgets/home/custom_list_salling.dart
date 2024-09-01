import 'package:e_commerce_app14/controllers/home/home_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/data/models/salling_items_model.dart';
import 'package:e_commerce_app14/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListBestSalling extends StatelessWidget {
  const CustomListBestSalling({super.key});

  @override
  Widget build(BuildContext context) {
  HomeControllerImp controller = Get.put(HomeControllerImp());
    return SizedBox(
        height: 180,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.sallingitems.length,
          itemBuilder: (context, index) {
            return SallingItems(sallingItemsModels: SallingItemsModels.fromJson(controller.sallingitems[index]) ,);
          },
        )
        );
  }
}


class SallingItems extends StatelessWidget {
  const SallingItems({super.key, required this.sallingItemsModels});
  final SallingItemsModels sallingItemsModels;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
              Positioned(
                top: 10,
                left: 3,
                child: Container(
                  height: 145,
                  width: 145,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 40,
                  right: 10,
                  bottom: 10
                ),
                margin: const EdgeInsets.only(left: 10),
                height: 150,
                width: 280,
                decoration: const BoxDecoration(),
                child: Image.network(
                  "${AppLink.imageItems}/${sallingItemsModels.itemsImage}",
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                top: 20,
                left: 0,
                child: SizedBox(
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          "${sallingItemsModels.itemsName}",
                          style: Styles.boldtextStyle14.copyWith(color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 35,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10)
                          ),
                          color: AppColor.kBackgroundColorMain
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text("${sallingItemsModels.itemsPrice} \$" ,style: Styles.boldtextStyle16.copyWith(color:Colors.white),),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]
            );
  }
}