import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/views/widgets/cart/appBar_cart.dart';
import 'package:e_commerce_app14/views/widgets/cart/list_items_cart.dart';
import 'package:e_commerce_app14/views/widgets/cart/price_details_cart.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBackgroundColorMain2,
      body: ListView(
        children: const  [
          AppBarCart(title: "Cart"),
           SizedBox(height: 10,),
          Padding(
            padding:  EdgeInsets.all(8),
            child: Column(
              children: [
                 ListItemsCart(),
                Divider()
              ],
            ),
          ),
            PriceDetailsCart()
        ],
      ),
    );
  }
}