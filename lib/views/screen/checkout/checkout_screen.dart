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
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColor.kBackgroundColorMain,
          onPressed: (){} , child: Text("Check Out" , style: Styles.boldtextStyle16.copyWith(color: Colors.white),),),
      ),
      backgroundColor: AppColor.kBackgroundColorMain2,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title:  Text("Check Out",style: Styles.boldtextStyle20.copyWith(color: Colors.white),),
        centerTitle: true,
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
                controller.selectionPayMent("cash");
              },
              child: PaymentMethodCheckOut(title: "Cash" , isActive: controller.paymentMethod=="cash"? true : false,)),
            
            const SizedBox(height: 10, ),

             InkWell(
              splashColor: Colors.transparent,
              onTap: (){
                controller.selectionPayMent("Payment");
              },
              child: PaymentMethodCheckOut(title: "Payment Cards" , isActive: controller.paymentMethod=="Payment"? true : false,)),



            const SizedBox(height: 20,),
            const Text("Choose delivery type",style: Styles.boldtextStyle16,),
            const SizedBox(height: 10,),


             Row(
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: (){controller.selectionDelivery("Delivery");},
                  child: DeliveryMethodCheckOut(title: "Delivery" , urL: "assets/images/006-delivery.png", isActive: controller.deliveryType=="Delivery"? true : false,)),
                
                
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: (){controller.selectionDelivery("Drive Thru");},
                  child: DeliveryMethodCheckOut(title: "Drive Thru" , urL: "assets/images/drivethru.png", isActive: controller.deliveryType=="Drive Thru"? true : false,)),
              ],
            ),
             const SizedBox(height: 20,),

             
            if(controller.deliveryType== "Delivery")  Column(
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
    );
  }
}
