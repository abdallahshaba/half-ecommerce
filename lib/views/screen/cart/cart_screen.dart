import 'package:e_commerce_app14/controllers/cart/cart_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/views/widgets/cart/custom_button_coupon.dart';
import 'package:e_commerce_app14/views/widgets/cart/custom_textField_coupon.dart';
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
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: AppColor.kBackgroundColorMain,
          title: Text("Cart" , style: Styles.boldtextStyle22.copyWith(color: Colors.white),),
        ),
      bottomNavigationBar: const  PriceDetailsCart(),
      backgroundColor: AppColor.kBackgroundColorMain2,
      body: ListView(
        children: [
         const SizedBox(height: 10,),
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
           Padding(
            padding: const  EdgeInsets.all(8),
            child: Column(
              children: [
                const ListItemsCart(), 
                 GetBuilder<CartControllerImp>(builder:(controller) => Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: SizedBox(
                            child: controller.couponName == null ? Row(
                              children: [
                              if(controller.data.isNotEmpty)  Expanded(
                                  flex: 2,
                                  child: CustomTextFieldCoupon(
                                    controllerCoupon: controller.controllerCoupon,
                                    hintText: "Enter Coupon")
                                ),
                               const SizedBox(width: 10,),
                              if(controller.data.isNotEmpty)  Expanded(
                                  child: CustomButtonCoupon(
                                    text: "Apply",
                                      onPressed: () {
                                        if (controller.controllerCoupon!.text.isNotEmpty) {
                                          controller.getCouponDataa();
                                        } else {
                                          Get.snackbar("Failed", "Please enter a coupon code",
                                            duration: const Duration(milliseconds: 1500),
                                            backgroundColor: AppColor.kBackgroundColorMain2
                                          );
                                        }
                                      },
                                    ),
                                  )
                              ],
                            ) : Container(
                              child: Text(" Coupon Code : ${controller.couponName}" ,),
                            ),
                          ),
                 ),
                 ),
              ],
            ),
          ),
        ],
      ),
    );
    },);
  }
}