import 'package:e_commerce_app14/core/class/status_request.dart';
import 'package:e_commerce_app14/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app14/data/dataSource/remote/test_data.dart';
import 'package:get/get.dart';

class TestDataConteoller extends GetxController {


  TestData testData =TestData(Get.find());
  List data = [];

  late StatusRequest statusRequest;

  getData2 () async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }
  @override
  void onInit() {
    getData2();
    super.onInit();
  }
}