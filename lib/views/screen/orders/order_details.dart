import 'package:e_commerce_app14/controllers/orders/order_details_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        child: ListView(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Table(
                  children:  [
                    TableRow(
                      children: [
                        Text("Item" , style: Styles.boldtextStyle18.copyWith(color: AppColor.kBackgroundColorMain), textAlign: TextAlign.center,),
                        Text("Quantity" , style: Styles.boldtextStyle18.copyWith(color: AppColor.kBackgroundColorMain), textAlign: TextAlign.center,),
                        Text("Price" , style: Styles.boldtextStyle18.copyWith(color: AppColor.kBackgroundColorMain), textAlign: TextAlign.center,),
                      ]
                    ), 
                    const TableRow(
                      children: [
                        Text("LapTop m1" ,style: TextStyle(color: Colors.black , fontSize: 14) , textAlign: TextAlign.center,),
                        Text("2" ,style: TextStyle(color: Colors.black , fontSize: 14) , textAlign: TextAlign.center,),
                        Text("1000 \$" ,style: TextStyle(color: Colors.black , fontSize: 14) , textAlign: TextAlign.center,),
                      ]
                    ),
                    const TableRow(
                      children: [
                        Text("LapTop m1" ,style: TextStyle(color: Colors.black , fontSize: 14) , textAlign: TextAlign.center,),
                        Text("2" ,style: TextStyle(color: Colors.black , fontSize: 14) , textAlign: TextAlign.center,),
                        Text("1000 \$" ,style: TextStyle(color: Colors.black , fontSize: 14) , textAlign: TextAlign.center,),
                      ]
                    ),
                  ],
                ),
              ),
            ), 
           const SizedBox(height: 10,),
           Card(child: const SizedBox(child: Padding(
             padding: EdgeInsets.all(8.0),
             child: Text("Total Order Price : 2300 \$" , style: Styles.boldtextStyle16, textAlign: TextAlign.center,),
           ))),


          // Lottie.asset(AppImageAsset.map , width: 300 , height: 300)
          ],
        ),
      ),
    );
  }
}