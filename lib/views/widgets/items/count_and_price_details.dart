import 'package:e_commerce_app14/controllers/iteme/item_detai_cont.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountAndPriceDetailsScreen extends StatelessWidget {
  const CountAndPriceDetailsScreen({super.key, this.onAdd, this.onRemove, required this.count});
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String count;
  @override
  Widget build(BuildContext context) {
    ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());
    return Row(
                children: [
                  Row(
                  children: [
                    IconButton(
                      onPressed: onAdd, icon: const Icon(Icons.add)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 2),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.kBackgroundColorMain)
                      ),
                      child:  Text(count , style: Styles.boldtextStyle14,),
                    ),
                    IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
                  ],
                  ),
                 const Spacer(),
                  controller.itemsModel.offers != null && int.tryParse(controller.itemsModel.offers!) != 0?
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        Text("${controller.itemsModel.itemsPrice} \$" , style: Styles.boldtextStyle20.copyWith(color: Colors.black , decoration: TextDecoration.lineThrough ,decorationThickness: 1.5),),
                        Text("${controller.itemsModel.newPrice} \$" , style: Styles.boldtextStyle24.copyWith(color: AppColor.kBackgroundColorMain),),
                      ],
                    ),
                  ) : Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text("${controller.itemsModel.itemsPrice} \$" , style: Styles.boldtextStyle20.copyWith(color: AppColor.kBackgroundColorMain),),
                  )
                ] 
               );
  }
}