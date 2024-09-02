import 'package:get/get.dart';

abstract class ItemsController extends GetxController{
  initialData();
  changeCat(int val);
}

class ItemsControllerImp extends ItemsController{

  List categories = [];
  int? selectedCat;

 @override
  void onInit() {
    initialData();
    super.onInit();
  }
  


  @override
  initialData() {
    categories = Get.arguments['categoriesArg'];
    selectedCat = Get.arguments['slectedCatArd'];
  }


 
  @override
  changeCat(val) {
    selectedCat = val;
    update();
  }
}