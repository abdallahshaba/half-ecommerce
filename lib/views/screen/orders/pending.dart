import 'package:e_commerce_app14/controllers/orders/pending_orders_controller.dart';
import 'package:e_commerce_app14/core/class/handling_data_view.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/data/models/orders_model.dart';
import 'package:e_commerce_app14/views/screen/orders/order_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingOrdersScreen extends StatelessWidget {
  const PendingOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrdersController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColor.kBackgroundColorMain,
        centerTitle: true,
        title:  Text("Pending Orders" , style: Styles.boldtextStyle20.copyWith(color: Colors.white),),
      ),
      backgroundColor: AppColor.kBackgroundColorMain2,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<PendingOrdersController>(builder:(controller) => HandlingDataView(
          statusRequest: controller.statusRequest, 
          widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              return  Cardd(
                ordersModel: controller.data[index],
              );
            },
        ),
          ),),
      ),
    );
  }
}

class Cardd extends GetView<PendingOrdersController> {
  const Cardd({super.key, required this.ordersModel});
  final OrderModel ordersModel;
  @override
  Widget build(BuildContext context) {
    return  Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order Number : ${ordersModel.ordersId}" , style: Styles.boldtextStyle16.copyWith(color: const Color.fromARGB(255, 94, 91, 91) ),),
                    const Divider(),
                    Text("Order Type : ${controller.orderTypeFunction(ordersModel.ordersType!)}" , style: Styles.boldtextStyle16.copyWith(color: const Color.fromARGB(255, 94, 91, 91) ),),
                    Text("Order Price : ${ordersModel.ordersPrice} \$" , style: Styles.boldtextStyle16.copyWith(color: const Color.fromARGB(255, 94, 91, 91) ),),
                    Text("Delivery Price : 10 \$" , style: Styles.boldtextStyle16.copyWith(color: const Color.fromARGB(255, 94, 91, 91) ),),
                    Text("Payment Method : ${controller.paymentMethodFunction(ordersModel.ordersPayment!)}" , style: Styles.boldtextStyle16.copyWith(color: const Color.fromARGB(255, 94, 91, 91) ),),
                    Text("Order State : ${controller.orderStateFunction(ordersModel.orderState!)}" , style: Styles.boldtextStyle16.copyWith(color: const Color.fromARGB(255, 94, 91, 91) ),),

                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Price : ${ordersModel.ordersTotalprice} \$" , style: Styles.boldtextStyle16.copyWith(color: AppColor.kBackgroundColorMain ),),
                        // ignore: sized_box_for_whitespace
                        Container(
                          width: 85,
                          child: MaterialButton(
                            elevation: 0,
                            height: 30,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            color: AppColor.kBackgroundColorMain2,
                            onPressed: (){
                              Get.to( const OrderDetailsScteen() , transition: Transition.fadeIn , arguments: {
                                "orderModelArg" : ordersModel
                              });
                            } , child: Text("Details" , style: Styles.boldtextStyle14.copyWith(color: const Color.fromARGB(255, 84, 83, 83)),),),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            );
  }
}