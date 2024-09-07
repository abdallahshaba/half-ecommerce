import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app14/controllers/fav/favorite_controller.dart';
import 'package:e_commerce_app14/controllers/iteme/item_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/data/models/items_general_model.dart';
import 'package:e_commerce_app14/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridViewItems extends StatelessWidget {
  const GridViewItems({super.key});
  @override
  Widget build(BuildContext context) {
    FavoriteControllerImp favoriteController = Get.put(FavoriteControllerImp());
    return GetBuilder<ItemsControllerImp>(builder:(controller) {
      return GridView.builder(
            itemCount: controller.item.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.62
              ), 
            itemBuilder:(context, index) {
              favoriteController.favorite[controller.item[index]['items_id']] = controller.item[index]['favorite'];
              return CardItem(
                itemsModel: ItemsGeneralModel.fromJson(controller.item[index]),);
            },
            );
    },);
  }
}


class CardItem extends GetView<ItemsControllerImp> {
  const CardItem( {super.key, required this.itemsModel});
  final ItemsGeneralModel itemsModel;
  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
   FavoriteControllerImp favoriteController = Get.put(FavoriteControllerImp());
    return InkWell(
      onTap: () {
        controller.goToItemDetailsScreen(itemsModel);
      },
                child: Stack(
                  children:[ 
                    Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const SizedBox(height: 6,),
                        Hero(
                          tag: "${itemsModel.itemsId}" ,
                          child: CachedNetworkImage(
                             imageUrl: "${AppLink.imageItems}/${itemsModel.itemsImage!}" , fit: BoxFit.contain , height: 110,width: 145,
                                          
                                        ),
                        ),
                       const SizedBox(height:8,),
                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Text("${itemsModel.itemsName}" , style: Styles.boldtextStyle16.copyWith(color: AppColor.kBackgroundColorMain),),
                            ],
                          ),
                        ),
                          Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                            height: 40,
                            child: Text("${itemsModel.itemsDesc}" , style: Styles.regulartextStyle14,textAlign: TextAlign.start,),
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
                             Text("${itemsModel.itemsPrice} \$" , style: Styles.boldtextStyle16.copyWith(color: AppColor.kBackgroundColorMain),),
                            GetBuilder<FavoriteControllerImp>(builder:(controllerrr) => 
                            IconButton(onPressed:() {
                              if (favoriteController.favorite[itemsModel.itemsId]=="1") {
                                 controllerrr.setFavorite(itemsModel.itemsId, "0");
                                 favoriteController.removefavorites(itemsModel.itemsId);
                              }else{
                                controllerrr.setFavorite(itemsModel.itemsId, "1");
                                favoriteController.addfavorites(itemsModel.itemsId);
                              }
                            }, 
                            icon: favoriteController.favorite[itemsModel.itemsId]=="1"? const Icon(Icons.favorite , color: Colors.red,) : const Icon(Icons.favorite_border_outlined , color: Colors.red,) ),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                    itemsModel.offers != null && int.tryParse(itemsModel.offers!) != 0?
                  Positioned(
                    left: 135,
                    top: 13,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange
                      ),
                      child: const Center(child: Text("OFF" , style: Styles.boldtextStyle12,)),
                    ),
                  ): const SizedBox.shrink() 
                ]),
              );
  }
}