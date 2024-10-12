import 'package:e_commerce_app14/core/class/status_request.dart';
import 'package:e_commerce_app14/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app14/core/services/services.dart';
import 'package:e_commerce_app14/data/dataSource/remote/orders/orders.dart';
import 'package:e_commerce_app14/data/models/order_details_model.dart';
import 'package:e_commerce_app14/data/models/orders_model.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController{

 late OrderModel ordersModel ;
 late StatusRequest statusRequest;
 MyServices myServices = Get.find();
 OrdersData ordersData = OrdersData(Get.find()); 

 List<OrdersDetailsModel> data = [];

   getData2 () async {
    statusRequest = StatusRequest.loading;
    var response = await ordersData.getOrderDetailsData(ordersModel.ordersId);
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listData = response['data'];
        data.addAll(listData.map((e) => OrdersDetailsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }
















 @override
  void onInit() {
    ordersModel = Get.arguments["orderModelArg"];
    print("/////////////////////////////////////////////////////////////////////${ordersModel.ordersId}");
    getData2 ();
    super.onInit();
  }
}