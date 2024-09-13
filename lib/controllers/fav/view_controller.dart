import 'package:e_commerce_app14/core/class/status_request.dart';
import 'package:e_commerce_app14/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app14/core/services/services.dart';
import 'package:e_commerce_app14/data/dataSource/remote/fav/favorites_remote.dart';
import 'package:get/get.dart';

abstract class MyFavoriteController extends GetxController{
  viewFavorites();
  deleteFromFavoriteScreen( String favoriteId);

 } 
 class MyFavoriteControllerImp extends MyFavoriteController {

  FavoriteData myfavoriteData = FavoriteData(Get.find());
   List data = [];

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  


  
  @override
  void onInit() {
    viewFavorites();
    super.onInit();
  }

@override
  viewFavorites()async {
      statusRequest = StatusRequest.loading;
    var response = await myfavoriteData.viewFavoriteData(myServices.sharedPreference.getString("id"));

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response["message"]);
        print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++$data");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  
  @override
    deleteFromFavoriteScreen(String favoriteId)  {
    var response =  myfavoriteData.deleteFromFavoriteScreenData(favoriteId);
        data.removeWhere((element) => element['favoriteId'] == favoriteId);
        update(); //
        print(response);
      } 
    }