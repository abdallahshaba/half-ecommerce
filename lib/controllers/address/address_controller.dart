import 'package:e_commerce_app14/core/class/status_request.dart';
import 'package:e_commerce_app14/core/constant/appRouts.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app14/core/services/services.dart';
import 'package:e_commerce_app14/data/dataSource/remote/address/address_remote.dart';
import 'package:e_commerce_app14/data/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController{

  late TextEditingController city;
  late TextEditingController street;
  late TextEditingController name;

  AddressData addressData = AddressData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  // GlobalKey<FormState> formstate = GlobalKey<FormState>();
  List<AddressModel> data = [];
   
  
  goToEditAddress(addressModel){
    Get.toNamed(AppRouts.addressEdite , arguments: {
      "addressModelarg" : addressModel
    });
  }

  addAddress() async{
      statusRequest = StatusRequest.loading;
    var response = await addressData.addAddress(
      myServices.sharedPreference.getString("id"), city.text , street.text , name.text,);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar("Done", "Address Added" , 
        duration: const Duration(milliseconds: 1500) , 
        icon: const Icon(Icons.done) , 
        animationDuration: const Duration(milliseconds: 1000),
        backgroundColor: AppColor.kBackgroundColorMain2,
        );
        city.clear();
        name.clear();
        street.clear();
        Get.toNamed(AppRouts.addressView);
        update();
        viewAddress();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  

  viewAddress() async{
    statusRequest = StatusRequest.loading;
    data.clear();
    var response = await addressData.viewAddress(
      myServices.sharedPreference.getString("id"));
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
       List dataview = response['data'];
       data.addAll(dataview.map((e) => AddressModel.fromJson(e)));
       print("3333333333333333333333333333333333333333333333333333333333");
       print(data);

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }




  deleteAddress(addressId) async{
    statusRequest = StatusRequest.loading;
    var response = await addressData.deleteAddress(addressId);
    statusRequest = handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        //data.removeWhere((element) => element.addresId == addressId);
       print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
       print(data);

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }









  refreshData(){
    viewAddress();
    update();
  }

  // goToAddressScreen(){
  //   Get.toNamed(AppRouts.addressView);
  //   viewAddress();
  //   update();
  // }



  @override
  void onInit() {
    viewAddress();
    city = TextEditingController();
    street = TextEditingController();
    name = TextEditingController();
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