import 'package:e_commerce_app14/controllers/orders/order_details_controller.dart';
import 'package:e_commerce_app14/core/class/handling_data_view.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/imageAsset.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OrderDetailsScteen extends StatelessWidget {
  const OrderDetailsScteen({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(OrderDetailsController());
    return Scaffold(
      backgroundColor: AppColor.kBackgroundColorMain2,
      appBar: AppBar(
        backgroundColor: AppColor.kBackgroundColorMain,
        title: Text("Order Details" , style: Styles.boldtextStyle20.copyWith(color: Colors.white),),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child:  GetBuilder<OrderDetailsController>(builder:(controller) => HandlingDataView(
          statusRequest: controller.statusRequest, 
          widget: ListView(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Table(
                      children:  [
                        TableRow(
                          children: [
                            Text("Item" , style: Styles.boldtextStyle18.copyWith(color: AppColor.kBackgroundColorMain), textAlign: TextAlign.center,),
                            Text("Quantity" , style: Styles.boldtextStyle18.copyWith(color: AppColor.kBackgroundColorMain), textAlign: TextAlign.center,),
                            Text("Price" , style: Styles.boldtextStyle18.copyWith(color: AppColor.kBackgroundColorMain), textAlign: TextAlign.center,),
                          ]
                        ), 
                        ...List.generate(controller.data.length, (index) =>  TableRow(
                          children: [
                            Text("${controller.data[index].itemsName}" ,style: const TextStyle(color: Colors.black , fontSize: 14) , textAlign: TextAlign.center,),
                            Text("${controller.data[index].totalItems}" ,style: const TextStyle(color: Colors.black , fontSize: 14) , textAlign: TextAlign.center,),
                            Text("${controller.data[index].itemsPrice} \$" ,style: const TextStyle(color: Colors.black , fontSize: 14) , textAlign: TextAlign.center,),
                          ]
                        ),)
                      ],
                    ),
              const SizedBox(height: 10,),
           SizedBox(child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text("Total Order Price : ${controller.ordersModel.ordersTotalprice} \$" , style: Styles.boldtextStyle16, textAlign: TextAlign.center,),
           )),
                  ],
                ),
              ),
            ), 
           if(controller.ordersModel.ordersType=="0") Card(
              child: ListTile(
                title: Text("Shipping Address" , style: Styles.boldtextStyle16.copyWith(color: AppColor.kBackgroundColorMain),),
              subtitle: Text("${controller.ordersModel.addresCity}" " , ${controller.ordersModel.addresStreet}"),
              ),
            ),
           Lottie.asset(AppImageAsset.map , width: 300 , height: 300 , repeat: false )
          ],
        ),
          ),)
      ),
    );
  }
}