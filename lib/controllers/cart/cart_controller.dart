import 'package:e_commerce_app14/core/class/status_request.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app14/core/services/services.dart';
import 'package:e_commerce_app14/data/dataSource/remote/cart/cart_data.dart';
import 'package:e_commerce_app14/data/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController{
   addCart(itemid);
   deleteCart(itemid);
   viewCart();
   getCount(itemid);
   resetVarCart();
   refreshVariableCart();

}

class CartControllerImp extends CartController{
   
   CartData cartData = CartData(Get.find());
   late StatusRequest statusRequest;
   MyServices myServices = Get.find();

  List<CartModel> data = [];
  double totalPrice = 0.0;
  int totalItems = 0;

  @override
  void onInit() {
    viewCart();
    super.onInit();
  }
  
  @override
  addCart(itemid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.addCart(myServices.sharedPreference.getString("id"), itemid);
     statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar("Done", "The item has been added to the cart" , 
        duration: const Duration(milliseconds: 1500) , 
        icon: const Icon(Icons.done) , 
        animationDuration: const Duration(milliseconds: 1000),
        backgroundColor: AppColor.kBackgroundColorMain2
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  
  @override
  deleteCart(itemid)async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.deleteCart(myServices.sharedPreference.getString("id"), itemid);
     statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
         Get.snackbar("Done", "The item has been removed to the cart" , 
        duration: const Duration(milliseconds: 1500) , 
        icon: const Icon(Icons.done) , 
        animationDuration: const Duration(milliseconds: 1000),
        backgroundColor: AppColor.kBackgroundColorMain2
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  
  @override
  getCount(itemid) async{
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountOfItemsCart(myServices.sharedPreference.getString("id"), itemid);
     statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        int count = 0;
        count = int.parse(response['data']);
        print("------------------------------------------------------------$count");
        return count;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  
  @override
  viewCart() async{
     statusRequest = StatusRequest.loading;
    var response = await cartData.viewCart(myServices.sharedPreference.getString("id"));
     statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List dataCart = response['dataCart'];
        data.addAll(dataCart.map((e) => CartModel.fromJson(e)));
        Map countAndPrice = response['totalCountAndPrice'];
        totalPrice = double.parse(countAndPrice['totalPrice']);
        totalItems = int.parse(countAndPrice['totalItems']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  
  @override
  refreshVariableCart() {
    resetVarCart();
    viewCart();
  }
  
  @override
  resetVarCart() {
    totalPrice = 0.0;
    data.clear();
  }
  
}


