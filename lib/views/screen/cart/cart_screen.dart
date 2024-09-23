import 'package:e_commerce_app14/controllers/cart/cart_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/views/widgets/cart/appBar_cart.dart';
import 'package:e_commerce_app14/views/widgets/cart/list_items_cart.dart';
import 'package:e_commerce_app14/views/widgets/cart/price_details_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key,});
  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return  GetBuilder<CartControllerImp>(builder:(controller) {
      return Scaffold(
      bottomNavigationBar:  PriceDetailsCart(
        onPressed: () {
          
        },
        controllerCoupoon: controller.controllerCoupon!,
      ),
      backgroundColor: AppColor.kBackgroundColorMain2,
      body: ListView(
        children: [
         const SizedBox(height: 10,),
         const AppBarCart(title: "Cart"),
         const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
           
              GetBuilder<CartControllerImp>(builder:(controller) => Container(
                height: 25,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Center(child: Text(" You have in your cart ${controller.totalItems} items" , style: Styles.boldtextStyle14.copyWith(color: const Color.fromARGB(255, 171, 171, 171)),)),
              ),)
            ],
          ),
          const Padding(
            padding:  EdgeInsets.all(8),
            child: Column(
              children: [
                 ListItemsCart(),
              ],
            ),
          ),
            
        ],
      ),
    );
    },);
  }
}