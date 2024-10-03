import 'package:e_commerce_app14/controllers/cart/cart_controller.dart';
import 'package:e_commerce_app14/core/class/status_request.dart';
import 'package:e_commerce_app14/core/constant/appRouts.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app14/core/services/services.dart';
import 'package:e_commerce_app14/data/dataSource/remote/address/address_remote.dart';
import 'package:e_commerce_app14/data/dataSource/remote/checkOut/check_out_data.dart';
import 'package:e_commerce_app14/data/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CheckOutController extends GetxController{
 
  StatusRequest statusRequest = StatusRequest.noone;
  String? paymentMethod;
  String? deliveryType ;
  String addressSpace = "0";
  late String couponDisCount;
  
  String? couponName;
  String? totalPrice;

  AddressData testData =AddressData(Get.find());
  CheckOutData checkOutData = CheckOutData(Get.find());
  List<AddressModel> data = [];
  MyServices myServices =Get.find();

  CartControllerImp cartController = CartControllerImp();

  getAddress2 () async {
    statusRequest = StatusRequest.loading;
    var response = await testData.viewAddress(myServices.sharedPreference.getString("id"));
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List addressData = response['data'];
        data.addAll(addressData.map((e) => AddressModel.fromJson(e)));
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
   
    
   refreshScreen(){
     cartController.viewItemsCart();
     update();
   }




   getCheckOut () async {
    statusRequest = StatusRequest.noone;

    if(paymentMethod == null) return  Get.snackbar("warning" , "Please inter Payment Method" , backgroundColor: Colors.white);
    if(deliveryType == null) return  Get.snackbar("warning" , "Please inter delivery Type" , backgroundColor: Colors.white);


    Map dataa = {
      "orderPayment"   : paymentMethod.toString(),
      "orderCoupon"    : couponName.toString(),
      "orderType"      : deliveryType.toString(),
      "orderUserId"    : myServices.sharedPreference.getString("id"),
      "deliveryPrice"  : "10",
      "orderPrice"     : totalPrice,
      "orderAddress"   : addressSpace.toString(),
      "couponDiscount" : couponDisCount.toString(),

    };
    var response = await checkOutData.checkOutt(dataa);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRouts.homeGeneral);
         Get.snackbar(
          "Done" , "CheckOut Successfully" , backgroundColor: AppColor.kBackgroundColorMain,
          colorText: Colors.white,
          );
              print("////////////////////////////////////////////////////////////////////////");
        print(dataa);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }



 selectionPayMent(String val){
    paymentMethod = val;
    update();
 }

 selectionDelivery(String val){
    deliveryType = val;
    update();
 }

 selectionAddress(String val){
    addressSpace = val;
    update();
 }
  

  
 

@override
  void onInit() {
    couponName = Get.arguments['orderCouponArg'];
    totalPrice = Get.arguments['orderPriceArg'];
    couponDisCount = Get.arguments['couponDiscountArg'].toString();
    cartController.viewItemsCart();
    print("/////////////////////////////////////////////////////////////////////////////$couponDisCount");
    print("//////////////////////////////////////////$couponName");
    print("//////////////////////////////////////////$totalPrice");

    getAddress2();
    super.onInit();
  }
}