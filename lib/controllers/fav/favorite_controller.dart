import 'package:e_commerce_app14/core/class/status_request.dart';
import 'package:e_commerce_app14/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app14/core/services/services.dart';
import 'package:e_commerce_app14/data/dataSource/remote/fav/add.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController{

  setFavorite(itemId , value);
  addfavorites (itemId);
  removefavorites (itemId);

 } 
 class FavoriteControllerImp extends FavoriteController {

  FavoriteData favoriteData =FavoriteData(Get.find());
  // List data = [];
   var favoriteItems = [];
    var isLoaded = false;

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  
  Map favorite = {};
  
  @override
  setFavorite(itemId , value) {
    favorite[itemId] = value;
    update();
  }


  
  @override
  void onInit() {

    super.onInit();
  }

  @override
  addfavorites (itemId) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavoriteData(myServices.sharedPreference.getString("id") , itemId);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar("Done", "${response['message']}");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

  }

  @override
  removefavorites (itemId) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavoriteData(myServices.sharedPreference.getString("id") , itemId);

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar("Done", "${response['message']}");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

  }
  
 }