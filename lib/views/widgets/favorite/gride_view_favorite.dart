import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app14/controllers/fav/view_controller.dart';
import 'package:e_commerce_app14/core/class/handling_data_view.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/data/models/myFavorite_model.dart';
import 'package:e_commerce_app14/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class GridViewFavorites extends StatelessWidget {
  const GridViewFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFavoriteControllerImp>(builder:(controller) => HandlingDataView(
            statusRequest: controller.statusRequest, 
            widget: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.64,
              crossAxisCount: 2
              ), 
            itemBuilder:(context, index) {
              return  CardItem(
                myFavoriteModel: MyFavoriteModel.fromJson(controller.data[index]),
              );
            },
              ),
            ),
          );
  }
}


class CardItem extends GetView<MyFavoriteControllerImp> {
  const CardItem({super.key, required this.myFavoriteModel});
  final MyFavoriteModel myFavoriteModel;
  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp());
    return InkWell(
      onTap: () {},
                child: Stack(
                  children:[ 
                    Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const SizedBox(height: 6,),
                        Hero(
                          tag: "${myFavoriteModel.itemsId}" ,
                          child: CachedNetworkImage(
                             imageUrl: "${AppLink.imageItems}/${myFavoriteModel.itemsImage}" , fit: BoxFit.contain , height: 110,width: 145,
                     ),
                        ),
                       const SizedBox(height:10,),
                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Text("${myFavoriteModel.itemsName}" , style: Styles.boldtextStyle16.copyWith(color: AppColor.kBackgroundColorMain),),
                            ],
                          ),
                        ),
                        const SizedBox(height:4,),
                          Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                            height: 40,
                            child: Text("${myFavoriteModel.itemsDesc}" , style: Styles.regulartextStyle14,textAlign: TextAlign.start,),
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
                        const SizedBox(height: 10,),
                          Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             IconButton(onPressed: (){
                              controller.deleteFromFavoriteScreen(myFavoriteModel.favoriteId!);
                              
                             }, icon: const Icon(Icons.delete)),
                             Text("${myFavoriteModel.itemsPrice} \$" , style: Styles.boldtextStyle16.copyWith(color: AppColor.kBackgroundColorMain),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  myFavoriteModel.offers != null && int.tryParse( myFavoriteModel.offers!) != 0?
                  Positioned(
                    left: 135,
                    top: 13,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange
                      ),
                      child: const Center(child: Text("OFF" , style: Styles.boldtextStyle12,)),
                    ),
                  ): const SizedBox.shrink() 
                ],
                ),
              );
  }
}