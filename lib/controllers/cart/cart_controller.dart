import 'package:e_commerce_app14/core/class/status_request.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app14/core/services/services.dart';
import 'package:e_commerce_app14/data/dataSource/remote/cart/cart_data.dart';
import 'package:e_commerce_app14/data/dataSource/remote/coupon/coupon_data.dart';
import 'package:e_commerce_app14/data/models/coupn_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController{
   addCart(itemid);
   deleteCart(itemid);
   countAndPrice();
   viewItemsCart();
   getCount(itemid);
   resetVarCart();
   refreshVariableCart();
   getCouponDataa();
   totalPriceAfterAddCoupon();
}

class CartControllerImp extends CartController{
   
   CartData cartData = CartData(Get.find());
   late StatusRequest statusRequest;
   MyServices myServices = Get.find();

  List data = [];
  double totalPrice = 0.0;
  int totalItems = 0;
    
  TextEditingController? controllerCoupon;

  CouponsData couponsData = CouponsData(Get.find());

  CouponModel model = CouponModel();

  String? couponName;
  int? couponDiscount = 0;





  @override
  void onInit() {
    viewItemsCart();
    countAndPrice();
    controllerCoupon = TextEditingController();
    super.onInit();
  }
  
@override
addCart(itemid) async {
  statusRequest = StatusRequest.loading;
  var response = await cartData.addCart(myServices.sharedPreference.getString("id"), itemid);
  statusRequest = handlingData(response);

  if (StatusRequest.success == statusRequest) {
    if (response['status'] == 'success') {
      Get.snackbar("Done", "The item has been added to the cart",
        duration: const Duration(milliseconds: 1500),
        icon: const Icon(Icons.done),
        animationDuration: const Duration(milliseconds: 1000),
        backgroundColor: AppColor.kBackgroundColorMain2
      );
      // هنا يتم استدعاء دالة تحديث الأسعار بعد إضافة المنتج
      await countAndPrice();
    } else {
      statusRequest = StatusRequest.failure;
    }
  }
  update();
}
  
  @override
deleteCart(itemid) async {
  statusRequest = StatusRequest.loading;
  var response = await cartData.deleteCart(myServices.sharedPreference.getString("id"), itemid);
  statusRequest = handlingData(response);

  if (StatusRequest.success == statusRequest) {
    if (response['status'] == 'success') {
      Get.snackbar("Done", "The item has been removed from the cart",
        duration: const Duration(milliseconds: 1500),
        icon: const Icon(Icons.done),
        animationDuration: const Duration(milliseconds: 1000),
        backgroundColor: AppColor.kBackgroundColorMain2
      );
      // تحديث السعر بعد حذف المنتج
      await countAndPrice();
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
  countAndPrice() async{
     statusRequest = StatusRequest.loading;
    var response = await cartData.viewCart(myServices.sharedPreference.getString("id"));
     statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success'){
        Map countAndPrice = response['totalCountAndPrice'];
        totalPrice = double.parse(countAndPrice['totalPrice']);
        totalItems = int.parse(countAndPrice['totalItems']);
        update();
        }
        else{
          totalItems = 0;
          totalPrice = 0;
          update();
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    update();
  }
  
  @override
  refreshVariableCart() {
    resetVarCart();
    viewItemsCart();
    update();
  }
  
  @override
  resetVarCart() {
    data.clear();
  }
  
  @override
  viewItemsCart() async {
 statusRequest = StatusRequest.loading;
    var response = await cartData.viewItemsCart(myServices.sharedPreference.getString("id"));
     statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['message']);
        update();
      } else {
        //statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  
  @override
  getCouponDataa() async {
     statusRequest = StatusRequest.loading;
     update();
  var response = await couponsData.getCouponData(controllerCoupon!.text);
  statusRequest = handlingData(response);

  if (StatusRequest.success == statusRequest) {
    if (response['status'] == 'success') {
      Map<String, dynamic> dataCoupon = response['data'];
      model = CouponModel.fromJson(dataCoupon);
      couponName = model.couponName;
      couponDiscount = int.parse(model.couponDiscount!);
      Get.snackbar("Done", "Discount Added",
        duration: const Duration(milliseconds: 1500),
        icon: const Icon(Icons.done),
        animationDuration: const Duration(milliseconds: 1000),
        backgroundColor: AppColor.kBackgroundColorMain2
      );
    } else {
      couponDiscount = 0;
      couponName = null;
      Get.snackbar("Failed", "Invalid Coupon",
        duration: const Duration(milliseconds: 1500),
        animationDuration: const Duration(milliseconds: 1000),
        backgroundColor: AppColor.kBackgroundColorMain2
      );
    }
  }
  update();
  }
  
  @override
  totalPriceAfterAddCoupon() {
    return (totalPrice - totalPrice* couponDiscount! /100);
  }

  
}


