import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app14/controllers/cart/cart_controller.dart';
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
    return GetBuilder<CartControllerImp>(builder:(controller) =>  ListView.builder(
      itemCount: controller.data.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return  Cardd(
          cartModel: CartModel.fromJson(controller.data[index])
        );
      },
    )
      );
  }
}


class Cardd extends StatelessWidget {
  const Cardd({super.key, required this.cartModel});
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
  CartControllerImp controllerImp = Get.put(CartControllerImp());
    return InkWell(
      onTap: () {
      },
      child: Stack(
        children: [
          Card(
              child: SizedBox(
                child: 
                  Row(
                    children: [
                     Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: CachedNetworkImage(
                          imageUrl: "${AppLink.imageItems}/${cartModel.itemsImage!}" , fit: BoxFit.contain , height: 90,             
                        ),
                      ),),      
                              cartModel.offers != null && int.tryParse(cartModel.offers!) != 0? Expanded(
                                flex: 3,
                                child: ListTile(
                                  title:  Text("${cartModel.itemsName}" , 
                                  style: Styles.boldtextStyle16,) , 
                                  subtitle:  Row(
                                    children: [
                                      Text("${cartModel.newPrice} \$ " , 
                                      style: Styles.boldtextStyle18.copyWith(color: AppColor.kBackgroundColorMain),),
                                      const Text("(After OFF)")
                                    ],
                                  ),)) : Expanded(
                                flex: 3,
                                child: ListTile(
                                  title:  Text("${cartModel.itemsName}" , 
                                  style: Styles.boldtextStyle16,),
                                  subtitle:  Text("${cartModel.itemsPrice} \$" , 
                                  style: Styles.boldtextStyle18.copyWith(color: AppColor.kBackgroundColorMain),),)) ,
                               Expanded(
                                child: Column(
                                  children: [
                                IconButton(
                                  onPressed: () async {
                                    await controllerImp.addCart(cartModel.itemsId);
                                    await controllerImp.countAndPrice(); 
                                    controllerImp.refreshVariableCart();
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                                Text("${cartModel.countitems}" , style: Styles.boldtextStyle16,),
                                IconButton(
                                  onPressed: () async {
                                    await controllerImp.deleteCart(cartModel.itemsId);
                                    await controllerImp.countAndPrice(); 
                                    controllerImp.refreshVariableCart();
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                              ],
                              ),
                              ),
                            ],
                          ),
                        ),
                      ),
                       cartModel.offers != null && int.tryParse(cartModel.offers!) != 0? Positioned(
                                  left: 300,
                                  bottom: 45,
                                  child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        const Text("OFF"  , style: Styles.boldtextStyle14,),
                                        Text("${cartModel.offers}%" , style: Styles.boldtextStyle14,)
                                      ],
                                    ),
                                  ),                             ),
                                ): const SizedBox.shrink(),
      ]
      ),
    );
  }
}