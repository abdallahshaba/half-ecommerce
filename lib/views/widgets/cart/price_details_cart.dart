import 'package:e_commerce_app14/controllers/cart/cart_controller.dart';
import 'package:e_commerce_app14/core/class/handling_data_view.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/views/widgets/cart/custom_button_coupon.dart';
import 'package:e_commerce_app14/views/widgets/cart/custom_textField_coupon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceDetailsCart extends StatelessWidget {
  const PriceDetailsCart({super.key, this.onPressed, required this.controllerCoupoon});
  final void Function()? onPressed;
  final TextEditingController controllerCoupoon;
  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return GetBuilder<CartControllerImp>(builder:(controller) => HandlingDataView(
     statusRequest: controller.statusRequest, 
     widget: Padding(
       padding: const EdgeInsets.only(top: 10),
       child: SizedBox(
              height: 225,
              width: double.infinity,
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child:  Column(
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomTextFieldCoupon(
                            controllerCoupoon: controllerCoupoon ,
                            hintText: "Enter Coupon")
                        ),
                       const SizedBox(width: 10,),
                        Expanded(
                          child: CustomButtonCoupon(
                            onPressed: onPressed
                          )
                          )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1)
                    ),
                    child: Column(
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
                        Text("Discount" , style: Styles.boldtextStyle16,),
                        Text("10%"  , style: Styles.boldtextStyle16,)
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
                      ],
                    ),
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