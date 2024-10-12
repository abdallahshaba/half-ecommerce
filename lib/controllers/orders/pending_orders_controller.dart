import 'package:e_commerce_app14/core/class/status_request.dart';
import 'package:e_commerce_app14/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app14/core/services/services.dart';
import 'package:e_commerce_app14/data/dataSource/remote/orders/orders.dart';
import 'package:e_commerce_app14/data/models/orders_model.dart';
import 'package:get/get.dart';

class PendingOrdersController extends GetxController{
  OrdersData testData =OrdersData(Get.find());
  List<OrderModel> data = [];

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  

 String orderTypeFunction(String val){
     if(val == "0"){return "Delivery";}
     else{return "Recive";}
  } 

  String paymentMethodFunction(String val){
     if(val == "0"){return "Cash on delivery";}
     else{return "Payment Card";}
  } 

  String orderStateFunction(String val){
     if(val == "0"){return "await approval";}
     else if (val == "1"){return "pepared";}
     else if (val == "2"){return "On the way";}
     else { return "On the way"; }

  } 



  getPendingOrdersData () async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getPendingOrdersData(myServices.sharedPreference.getString("id"));

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
       List listData = response['data'];
       data.addAll(listData.map((e) => OrderModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }

  @override
  void onInit() {
    getPendingOrdersData ();
    super.onInit();
  }
}