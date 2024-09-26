
import 'package:e_commerce_app14/controllers/address/address_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/core/functions/valid_input.dart';
import 'package:e_commerce_app14/views/widgets/address/cutome_text_filed_add.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


// ignore: must_be_immutable
class AddAddressScreen extends GetView<AddressController> {
   const AddAddressScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AddressController());
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(9.0),
        child: MaterialButton(
                        height: 40,
                        onPressed: (){
                          controller.addAddress();
                          //controller.goToAddressScreen();
                        } , 
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))  , 
                        color: AppColor.kBackgroundColorMain ,
                         child:Text("Add" , style: Styles.boldtextStyle18.copyWith(color: Colors.white),)
                        ),
      ),
      backgroundColor: AppColor.kBackgroundColorMain2,
    
      appBar: AppBar(
        backgroundColor: AppColor.kBackgroundColorMain,
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        title: Text("Add new address" , style: Styles.boldtextStyle20.copyWith(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            const SizedBox(height: 10,),
            CustomTextFieldAddress(
              validator: (value) {
                return validInput(value!, 2, 20, "region");
              },
              hintText: "Enter the region", 
              label: "Region",
              mycontroller: controller.name,
              ),
            const SizedBox(height: 13,),
            CustomTextFieldAddress(
              validator: (value) {
                return validInput(value!, 2, 20, "city");
              },
              hintText: "Enter the City", 
              label: "City",
              mycontroller: controller.city,
              ),
            const SizedBox(height: 13,),
            CustomTextFieldAddress(
              validator: (value) {
                return validInput(value!, 2, 20, "street");
              },
              hintText: "Enter the street", 
              label: "Street",
              mycontroller: controller.street,
              ),
          ],
        ),
      ),
    );
  }
}