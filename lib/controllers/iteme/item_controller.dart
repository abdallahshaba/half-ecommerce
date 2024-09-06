import 'package:e_commerce_app14/core/class/status_request.dart';
import 'package:e_commerce_app14/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app14/core/services/services.dart';
import 'package:e_commerce_app14/data/dataSource/remote/items/items_remeot.dart';
import 'package:e_commerce_app14/data/models/items_general_model.dart';
import 'package:e_commerce_app14/views/screen/items_details/items_detiel_scre.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController{
  initialData();
  changeCat(int val, String changCatVal);
  getItemData(String catId );
  goToItemDetailsScreen(ItemsGeneralModel itemsModel);
}

class ItemsControllerImp extends ItemsController{
  
  ItemData itemData = ItemData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  
  List item = [];



  List categories = [];
  int? selectedCat;
  String? categoryId;

 @override
  void onInit() {
    initialData();
    getItemData(categoryId!);
    super.onInit();
  }
  


  @override
  initialData() {
    categories = Get.arguments['categoriesArg'];
    selectedCat = Get.arguments['slectedCatArd'];
    categoryId = Get.arguments['categoryIdArg'];
  }


 
  @override
  changeCat(val , changCatVal) {
    selectedCat = val;
    categoryId = changCatVal;
    getItemData(categoryId!);
    update();
  }
  
  @override
  getItemData(catId) async{
    item.clear();
 statusRequest = StatusRequest.loading;
    var response = await itemData.getData(catId , myServices.sharedPreference.getString("id"));
    print("==================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        item.addAll(response['data']);
        print("==============================================$categories");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  
  @override
  goToItemDetailsScreen(itemsModel) {
    Get.to(const ItemDetailsScreen() , transition: Transition.fadeIn , arguments: {
      "itemModelArg" :itemsModel
    });
  }
}