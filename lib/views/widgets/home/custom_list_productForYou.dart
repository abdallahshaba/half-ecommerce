// ignore: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app14/controllers/home/home_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/data/models/items_general_model.dart';
import 'package:e_commerce_app14/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListProductForYou extends StatelessWidget {
  const CustomListProductForYou({super.key});
 
  @override
  Widget build(BuildContext context) {
  HomeControllerImp controller = Get.put(HomeControllerImp());
    return SizedBox(
        height: 180,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return Items(itemsModel: ItemsGeneralModel.fromJson(controller.items[index]),);
          },
        )
        );
  }
}


class Items extends GetView<HomeControllerImp> {
  const Items({super.key, required this.itemsModel});
  final ItemsGeneralModel itemsModel;
  @override
  Widget build(BuildContext context) {
    return  Stack(children: [
                Positioned(
                  top: 10,
                  left: 3,
                  child: Container(
                    height: 145,
                    width: 145,
                    decoration: const BoxDecoration(
                        color:  Color.fromARGB(255, 255, 255, 255),
                        borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.goToItemDetailsScreen(itemsModel);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      left: 40,
                    ),
                    margin: const EdgeInsets.only(left: 10),
                    height: 150,
                    width: 280,
                    decoration: const BoxDecoration(),
                    child: CachedNetworkImage(
                             imageUrl: "${AppLink.imageItems}/${itemsModel.itemsImage!}" , fit: BoxFit.contain , height: 130,
                                          
                                        ),
                  ),
                ),
                Positioned(
                  top: 20,
                  child: SizedBox(
                    width: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "${itemsModel.itemsName}",
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
                            child: Text("${itemsModel.itemsPrice} \$" ,style: Styles.boldtextStyle16.copyWith(color:Colors.white),),
                          ),
                        ),
                        const SizedBox(height: 52,),
                        const Padding(
                          padding:  EdgeInsets.only(left: 7),
                          child:  Row(
                            children: [
                              Icon(Icons.favorite_border_outlined , size: 20,color: Colors.red,),
                              SizedBox(width: 10,),
                              Icon(Icons.shopping_cart_outlined , size: 20,color: AppColor.kBackgroundColorMain,)
                            ],
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