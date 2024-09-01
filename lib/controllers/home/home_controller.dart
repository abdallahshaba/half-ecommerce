import 'package:e_commerce_app14/core/class/status_request.dart';
import 'package:e_commerce_app14/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app14/core/services/services.dart';
import 'package:e_commerce_app14/data/dataSource/remote/home/home_remot.dart';
import 'package:e_commerce_app14/views/screen/items/items_screnn.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
   initialData();
   getDataa();
   goToItemsScreen(List categories , int selectedCat);
}
class HomeControllerImp extends HomeController{
  MyServices myServices = Get.find();
  String? username;
  HomeData homeData =HomeData(Get.find());
  List data = [];
  List categories = [];
  List items = [];
  List sallingitems = [];
  List offersItem = [];

  late StatusRequest statusRequest;

  initialData(){
    username = myServices.sharedPreference.getString("username");
    }



    @override
  getDataa() async {
     statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print("==================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
        sallingitems.addAll(response['sallingItem']);
        offersItem.addAll(response['offers']);
        print("==============================================$categories");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }





  @override
  void onInit() {
    getDataa();
    initialData();
    super.onInit();
  }
  
  @override
  goToItemsScreen(categories , selectedCat) {
  Get.to(const ItemsScreen() , transition: Transition.fadeIn , arguments: {
    "categoriesArg" : categories , "slectedCatArd" : selectedCat,
  });
  }
}