import 'package:e_commerce_app14/controllers/checkOut/checkOut_controller.dart';
import 'package:e_commerce_app14/core/class/handling_data_view.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/views/widgets/checkOut/address_method.dart';
import 'package:e_commerce_app14/views/widgets/checkOut/delivery_method.dart';
import 'package:e_commerce_app14/views/widgets/checkOut/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(CheckOutController());
    return GetBuilder<CheckOutController>(builder:(controller) => Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColor.kBackgroundColorMain,
          onPressed: (){
            controller.getCheckOut();
          } , child: Text("Check Out" , style: Styles.boldtextStyle16.copyWith(color: Colors.white),),),
      ),
      backgroundColor: AppColor.kBackgroundColorMain2,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title:  Text("Check Out",style: Styles.boldtextStyle20.copyWith(color: Colors.white),),
        centerTitle: true,
        leading:  IconButton(onPressed: (){
          Get.back();
          controller.cartController.refreshVariableCart();
        }, icon: const Icon(Icons.arrow_back)),
        backgroundColor: AppColor.kBackgroundColorMain,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<CheckOutController>(builder:(controller) => HandlingDataView(
          statusRequest: controller.statusRequest, 
          widget: ListView(
          children:  [
            const SizedBox(height: 20,),
            const Text( "Choose payment method",style: Styles.boldtextStyle16,),
            const SizedBox(height: 10,),


             InkWell(
              splashColor: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              onTap: (){
                controller.selectionPayMent("0");
              },
              child: PaymentMethodCheckOut(title: "Cash" , isActive: controller.paymentMethod=="0"? true : false,)),
            
            const SizedBox(height: 10, ),

             InkWell(
              splashColor: Colors.transparent,
              onTap: (){
                controller.selectionPayMent("1");
              },
              child: PaymentMethodCheckOut(title: "Payment Cards" , isActive: controller.paymentMethod=="1"? true : false,)),



            const SizedBox(height: 20,),
            const Text("Choose delivery type",style: Styles.boldtextStyle16,),
            const SizedBox(height: 10,),


             Row(
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: (){controller.selectionDelivery("0");},
                  child: DeliveryMethodCheckOut(title: "Delivery" , urL: "assets/images/006-delivery.png", isActive: controller.deliveryType=="0"? true : false,)),
                
                
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: (){controller.selectionDelivery("1");},
                  child: DeliveryMethodCheckOut(title: "Drive Thru" , urL: "assets/images/drivethru.png", isActive: controller.deliveryType=="1"? true : false,)),
              ],
            ),
             const SizedBox(height: 20,),

             
            if(controller.deliveryType== "0")  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Choose Shipping Address",style: Styles.boldtextStyle16,),
                 const SizedBox(height: 10,),
                ...List.generate(controller.data.length, (index) => InkWell(
                  onTap: () {
                    controller.selectionAddress("${controller.data[index].addresId}");
                  },
                  child: AddressMethodCheckOut(
                    address: "${controller.data[index].addresCity} , ${controller.data[index].addresStreet}", 
                    home: "${controller.data[index].addresName}", isActive: controller.addressSpace == controller.data[index].addresId? true : false, 
                    ),
                ),
)
                ],
              )
          ],
        ),
          ),)
      ),
    ),);
  }
}
