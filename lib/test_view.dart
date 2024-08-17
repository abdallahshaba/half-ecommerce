import 'package:e_commerce_app14/controllers/test_controller.dart';
import 'package:e_commerce_app14/core/class/handling_data_view.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestDataConteoller());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kPrimaryColor,
        title: Text("Test Data"),
      ),
      body: GetBuilder<TestDataConteoller>  (
        builder: (controller) {
         return HandlingDataView(
          statusRequest: controller.statusRequest,

           widget:  ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context , index){
                return Text("${controller.data}");
              }
              )
           );
        }
         ),
    );
  }
}