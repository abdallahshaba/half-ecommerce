import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app14/controllers/fav/favorite_controller.dart';
import 'package:e_commerce_app14/controllers/home/home_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/data/models/items_general_model.dart';
import 'package:e_commerce_app14/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListOffers extends StatelessWidget {
  const ListOffers({super.key});

  @override
  Widget build(BuildContext context) {
  HomeControllerImp controller = Get.put(HomeControllerImp());
    FavoriteControllerImp favoriteController = Get.put(FavoriteControllerImp());
    return SizedBox(
        child: GridView.builder(
            itemCount: controller.offersItem.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.72
              ), 
            itemBuilder:(context, index) {
              favoriteController.favorite[controller.offersItem[index]['items_id']] = controller.offersItem[index]['favorite'];
              return CardItem(
                offersModel: ItemsGeneralModel.fromJson(controller.offersItem[index]),);
            },
            )
        );
  }
}

class CardItem extends GetView<HomeControllerImp> {
  const CardItem( {super.key, required this.offersModel});
  final ItemsGeneralModel offersModel;
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
   HomeControllerImp controller = Get.put(HomeControllerImp());
   FavoriteControllerImp favoriteControllerImp = Get.put(FavoriteControllerImp());

   
    return InkWell(
      onTap: () {
        controller.goToItemDetailsScreen(offersModel);
      },
                child: Stack(
                  children:[ 
                    Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const SizedBox(height: 6,),
                        Hero(
                          tag: "${offersModel.itemsId}" ,
                          child: CachedNetworkImage(
                             imageUrl: "${AppLink.imageItems}/${offersModel.itemsImage!}" , fit: BoxFit.contain , height: 110,width: 145,
                                          
                                        ),
                        ),
                       const SizedBox(height:8,),
                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Text("${offersModel.itemsName}" , style: Styles.boldtextStyle16.copyWith(color: AppColor.kBackgroundColorMain),),
                            ],
                          ),
                        ),
                          Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                            height: 40,
                            child: Text("${offersModel.itemsDesc}" , style: Styles.regulartextStyle14,textAlign: TextAlign.start,),
                          ),
                        ),
                       const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 20,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text("Rating 3.5" , style: Styles.regulartextStyle14.copyWith(color: Colors.grey ),textAlign: TextAlign.start,),
                                ),
                              ),
                              ...List.generate(4, (index) => const Icon(Icons.star , color: Color.fromARGB(255, 252, 105, 0) , size: 15,))
                            ],
                          ),
                        ),
                          Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Text("${offersModel.itemsPrice} \$" , style: Styles.boldtextStyle16.copyWith(color: AppColor.kBackgroundColorMain),),
                            GetBuilder<FavoriteControllerImp>(builder:(controllerrr) => 
                            IconButton(onPressed:() {
                              if (favoriteControllerImp.favorite[offersModel.itemsId]=="1") {
                                 controllerrr.setFavorite(offersModel.itemsId, "0");
                                 controllerrr.removefavorites(offersModel.itemsId);
                              }else{
                                controllerrr.setFavorite(offersModel.itemsId, "1");
                                favoriteControllerImp.addfavorites(offersModel.itemsId);
                              }
                            }, 
                            icon: favoriteControllerImp.favorite[offersModel.itemsId]=="1"? const Icon(Icons.favorite , color: Colors.red,) : const Icon(Icons.favorite_border_outlined , color: Colors.red,) ),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                    offersModel.offers != null && int.tryParse(offersModel.offers!) != 0?
                  Positioned(
                    left: 135,
                    top: 13,
                    child: Container(
                      height: 35,
                      width: 45,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.orange
                      ),
                      child:  Column(
                        children: [
                          Center(child: Text("${offersModel.offers} %" , style: Styles.boldtextStyle12,)),
                          Center(child: Text("OFF" , style: Styles.boldtextStyle12,)),

                        ],
                      ),
                    ),
                  ): const SizedBox.shrink() 
                ]),
              );





  }}















class SallingItems extends GetView<HomeControllerImp> {
  const SallingItems({super.key, required this.offersModel});
  final ItemsGeneralModel offersModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemDetailsScreen(offersModel);
      },
      child: Stack(
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
              ),
    );
  }
}