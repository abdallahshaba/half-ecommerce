import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/views/address/add_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAdderssScreen extends StatelessWidget {
  const ViewAdderssScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBackgroundColorMain2,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.kBackgroundColorMain,
        onPressed: (){
          Get.to(  const AddAddressScreen() , transition: Transition.fade);
        },
        child: const Icon(Icons.add , color: Colors.white,) ,
        ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        backgroundColor: AppColor.kBackgroundColorMain,
        title:  Text("Address" , style: Styles.boldtextStyle20.copyWith(color: Colors.white),),
      ),
    );
  }
}