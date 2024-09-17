import 'package:e_commerce_app14/controllers/cart/cart_controller.dart';
import 'package:e_commerce_app14/core/class/handling_data_view.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceDetailsCart extends StatelessWidget {
  const PriceDetailsCart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return GetBuilder<CartControllerImp>(builder:(controller) => HandlingDataView(
     statusRequest: controller.statusRequest, 
     widget: Padding(
       padding: const EdgeInsets.only(top: 10),
       child: SizedBox(
              height: 150,
              width: double.infinity,
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child:  Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Price" , style: Styles.boldtextStyle16,),
                      Text("${controller.totalPrice} \$"  , style: Styles.boldtextStyle16,)
                    ],
                  ),
                 const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shipping" , style: Styles.boldtextStyle16,),
                      Text("300.300 \$"  , style: Styles.boldtextStyle16,)
                    ],
                  ),
                 const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total price" , style: Styles.boldtextStyle16,),
                      Text("300.300 \$"  , style: Styles.boldtextStyle16.copyWith(color: Color.fromARGB(255, 160, 1, 1)),)
                    ],
                  ),
                 const SizedBox(height: 10,),
                  SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: (){} , 
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))  , 
                      color: AppColor.kBackgroundColorMain ,
                       child: Text("Place Oreder" , 
                      style: Styles.boldtextStyle16.copyWith(color: Colors.white),), 
                      ),
                  )
                ],
                ),
              ),
            ),
     )
     ),);
  }
}