import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app14/controllers/cart/cart_controller.dart';
import 'package:e_commerce_app14/core/class/handling_data_view.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/data/models/cart_model.dart';
import 'package:e_commerce_app14/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsCart extends StatelessWidget {
  const ListItemsCart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(builder:(controller) => HandlingDataView(
      statusRequest: controller.statusRequest, 
      widget: ListView.builder(
      itemCount: controller.data.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return  Cardd(
          cartModel: controller.data[index]
        );
      },
    )
      ),);
  }
}


class Cardd extends StatelessWidget {
  const Cardd({super.key, required this.cartModel});
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
  CartControllerImp controllerImp = Get.put(CartControllerImp());
    return Card(
                    child: SizedBox(
                      child: 
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: CachedNetworkImage(
                           imageUrl: "${AppLink.imageItems}/${cartModel.itemsImage!}" , fit: BoxFit.contain , height: 90,
                                        
                            ),),
                           Expanded(
                            flex: 3,
                            child: ListTile(title:  Text("${cartModel.itemsName}" , style: Styles.boldtextStyle16,) , subtitle: Text("${cartModel.itemsPrice} \$" , style: Styles.boldtextStyle18.copyWith(color: AppColor.kBackgroundColorMain),),)),
                           Expanded(child: Column(children: [
                            IconButton(onPressed: ()async{
                             await controllerImp.addCart(cartModel.itemsId);
                              controllerImp.refreshVariableCart();
                            }, icon: const Icon(Icons.add)),
                            Text("${cartModel.countitems}" , style: Styles.boldtextStyle16,),
                            IconButton(onPressed: ()async{
                             await controllerImp.deleteCart(cartModel.itemsId);
                              controllerImp.refreshVariableCart();
                            }, icon: const Icon(Icons.remove)),
                          ],))
                        ],
                      ),
                    ),
                  );
  }
}