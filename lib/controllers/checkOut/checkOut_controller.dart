import 'package:e_commerce_app14/core/class/status_request.dart';
import 'package:e_commerce_app14/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app14/core/services/services.dart';
import 'package:e_commerce_app14/data/dataSource/remote/address/address_remote.dart';
import 'package:e_commerce_app14/data/models/address_model.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController{
 
 StatusRequest statusRequest = StatusRequest.noone;
 String? paymentMethod;
 String? deliveryType ;
 String? addressSpace;


AddressData testData =AddressData(Get.find());
  List<AddressModel> data = [];
  MyServices myServices =Get.find();

  getData2 () async {
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
    getData2();
    super.onInit();
  }
}