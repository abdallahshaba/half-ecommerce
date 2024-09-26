import 'package:e_commerce_app14/core/class/status_request.dart';
import 'package:e_commerce_app14/core/constant/appRouts.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app14/core/services/services.dart';
import 'package:e_commerce_app14/data/dataSource/remote/address/address_remote.dart';
import 'package:e_commerce_app14/data/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAddressController extends GetxController{
  late TextEditingController city;
  late TextEditingController street;
  late TextEditingController name;

  AddressData addressData = AddressData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();


  late AddressModel addressModel;


 initialData(){
    city.text = addressModel.addresCity!;
    street.text = addressModel.addresStreet!;
    name.text = addressModel.addresName!;
 }


  editeAddress() async{
    statusRequest = StatusRequest.loading;
    var response = await addressData.editAddress(
      addressModel.addresId,
      city.text,
      street.text,
      name.text,
      );
    statusRequest = handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRouts.addressView);
        Get.snackbar("Done", "Address Edited" , 
        duration: const Duration(milliseconds: 1500) , 
        icon: const Icon(Icons.done) , 
        animationDuration: const Duration(milliseconds: 1000),
        backgroundColor: AppColor.kBackgroundColorMain2,
        );

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }



  @override
  void onInit() async{
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    addressModel = await Get.arguments['addressModelarg'];
    initialData();
    super.onInit();
  }


  @override
  void dispose() {
    city.dispose();
    street.dispose();
    name.dispose();
    super.dispose();
  }
}