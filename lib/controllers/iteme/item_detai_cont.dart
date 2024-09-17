import '../cart/cart_controller.dart';
import 'package:e_commerce_app14/data/models/items_general_model.dart';
import 'package:get/get.dart';

abstract class ItemDetailsController extends GetxController{
  initialData();
  showOfferUi();
  changItem(String value);
  addOperation();
  deleteOperation();
  refersh();
  reset();
} 

class ItemDetailsControllerImp extends ItemDetailsController{

 CartControllerImp controllerImp = CartControllerImp();
  

  int counttt = 0;

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
  initialData() async {
   itemsModel =  Get.arguments["itemModelArg"];
   counttt = await controllerImp.getCount(itemsModel.itemsId);
   update();
  }
  
  @override
  showOfferUi() {
  }
  
  @override
  changItem(value) {
    valueee = value;
    update();
  }
  
  @override
  addOperation() {
    counttt++;
    update();
  }
  
  @override
  deleteOperation() {
    if(counttt>0){
      counttt--;
      update();
    }
  }
  
  @override
  refersh() {
    initialData();
    update();
  }
  
  @override
  reset() {
    counttt = 0;
  }

}