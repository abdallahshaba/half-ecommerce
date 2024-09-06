import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app14/controllers/home/home_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/data/models/items_general_model.dart';
import 'package:e_commerce_app14/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListOffers extends StatelessWidget {
  const CustomListOffers({super.key});

  @override
  Widget build(BuildContext context) {
  HomeControllerImp controller = Get.put(HomeControllerImp());
    return SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.offersItem.length,
          itemBuilder: (context, index) {
            return SallingItems(offersModel: ItemsGeneralModel.fromJson(controller.offersItem[index]) ,);
          },
        )
        );
  }
}

class SallingItems extends StatelessWidget {
  const SallingItems({super.key, required this.offersModel});
  final ItemsGeneralModel offersModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
              Positioned(
                top: 20,
                left: 3,
                child: Container(
                  height: 145,
                  width: 145,
                  decoration: const BoxDecoration(
                      color:  Color.fromARGB(255, 255, 255, 255),
                      borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                          ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 9,
                  left: 40,
                  right: 10,
                  bottom: 0,
                ),
                margin: const EdgeInsets.only(left: 10),
                
                width: 280,
                decoration: const BoxDecoration(),
                child: CachedNetworkImage(
                         imageUrl: AppLink.imageItems + "/" + offersModel.itemsImage! , fit: BoxFit.contain , height: 130,
                                      
                                    ),
              ),
              Positioned(
                top: 25,
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
                          "${offersModel.itemsName}",
                          style: Styles.boldtextStyle14.copyWith(color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 29,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10)
                          ),
                          color: AppColor.kBackgroundColorMain
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text("${offersModel.newPrice} \$" ,style: Styles.boldtextStyle14.copyWith(color:Colors.white),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                                        '${offersModel.itemsPrice} \$',
                                        style: Styles.boldtextStyle14.copyWith(
                                          decoration: TextDecoration.lineThrough,
                                          decorationThickness: 2
                                          )
                                          ),
                      )],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 89, 0),
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Column(
                  children: [
                   const SizedBox(height: 4,),
                    Text("OFF" , style: Styles.boldtextStyle12.copyWith(color: Colors.white),),
                    Text("${offersModel.offers}%" ,style: Styles.boldtextStyle12.copyWith(color:Colors.white),),
                  ],
                ),
              ))
            ]
            );
  }
}