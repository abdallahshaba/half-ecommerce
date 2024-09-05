import 'package:e_commerce_app14/data/models/items_general_model.dart';
import 'package:get/get.dart';

abstract class ItemDetailsController extends GetxController{
  initialData();
  showOfferUi();
  changItem(String value);
} 

class ItemDetailsControllerImp extends ItemDetailsController{
 late ItemsGeneralModel itemsModel;
 String? valueee;
  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  List subTitle = [
    {"name" : "Red" , "id" : "1" , "active" : "0"},
    {"name" : "Blue" , "id" : "2" , "active" : "0"},
    {"name" : "Yellow" , "id" : "3" , "active" : "0"},
  ];
  
  @override
  initialData() {
   itemsModel = Get.arguments["itemModelArg"];
  }
  
  @override
  showOfferUi() {
  }
  
  @override
  changItem(value) {
    valueee = value;
    update();
  }

}