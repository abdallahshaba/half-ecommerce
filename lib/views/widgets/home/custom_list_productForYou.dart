import 'package:e_commerce_app14/controllers/home/home_controller.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/data/models/items_model.dart';
import 'package:e_commerce_app14/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListProductForYou extends StatelessWidget {
  const CustomListProductForYou({super.key});

  @override
  Widget build(BuildContext context) {
  HomeControllerImp controller = Get.put(HomeControllerImp());
    return SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return Items(itemsModel: ItemsModel.fromJson(controller.items[index]),);
          },
        )
        );
  }
}


class Items extends StatelessWidget {
  const Items({super.key, required this.itemsModel});
  final ItemsModel itemsModel;
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
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 40,
                ),
                margin: const EdgeInsets.only(left: 10),
                height: 150,
                width: 280,
                decoration: const BoxDecoration(),
                child: Image.network(
                  "${AppLink.imageItems}/${itemsModel.itemsImage}",
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                top: 20,
                left: 15,
                child: SizedBox(
                  width: 90,
                  child: Text(
                    "${itemsModel.itemsName}",
                    style: Styles.boldtextStyle14.copyWith(color: Colors.black),
                  ),
                ),
              ),
            ]
            );
  }
}