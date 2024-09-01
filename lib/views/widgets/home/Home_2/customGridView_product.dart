import 'package:e_commerce_app14/controllers/home/home_controller.dart';
import 'package:e_commerce_app14/data/models/items_model.dart';
import 'package:e_commerce_app14/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomGridViewProductForYou extends StatelessWidget {
  const CustomGridViewProductForYou({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(builder:(controller) {
      return GridView.builder(
              itemCount: controller.items.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 240,
                ),
                itemBuilder: (context, index) {
                  return  Items(itemsModel: ItemsModel.fromJson(controller.items[index]),);
                },
                );
    },);
  }
}


class Items extends StatelessWidget {
  const Items({super.key, required this.itemsModel});
  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
                    onTap: () {
                    },
                    child:  Container(
                      height: 300,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children:[
                          Container(
                            margin: EdgeInsets.all(10),
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.white
                            ),
                         ),
                        Positioned(
                          top: 0,
                          child: Container(
                                height: 135,
                                child: Image.network("${AppLink.imageItems}/${itemsModel.itemsImage}" , fit: BoxFit.fill,),
                              ),
                          )
                                         ] 
                                         ),
                    ),
                  );
  }
}