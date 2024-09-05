import 'package:cached_network_image/cached_network_image.dart';
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
              return CardItem(itemsModel: ItemsGeneralModel.fromJson(controller.item[index]),);
            },
            );
    },);
  }
}


class CardItem extends GetView<ItemsControllerImp> {
  const CardItem({super.key, required this.itemsModel});
  final ItemsGeneralModel itemsModel;
  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return InkWell(
      onTap: () {
        controller.goToItemDetailsScreen(itemsModel);
      },
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     const SizedBox(height: 6,),
                      Hero(
                        tag: "${itemsModel.itemsId}" ,
                        child: CachedNetworkImage(
                           imageUrl: "${AppLink.imageItems}/${itemsModel.itemsImage!}" , fit: BoxFit.contain , height: 116,
                                        
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
                          IconButton(onPressed:() {}, icon: const Icon(Icons.favorite_border_outlined , color: Colors.red,))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
  }
}