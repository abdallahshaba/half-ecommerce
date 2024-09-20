import 'package:e_commerce_app14/core/class/status_request.dart';
import 'package:e_commerce_app14/core/functions/handling_data_controller.dart';
import 'package:e_commerce_app14/core/services/services.dart';
import 'package:e_commerce_app14/data/dataSource/remote/home/home_remot.dart';
import 'package:e_commerce_app14/data/models/items_general_model.dart';
import 'package:e_commerce_app14/views/screen/items/items_screnn.dart';
import 'package:e_commerce_app14/views/screen/items_details/items_detiel_scre.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
   initialData();
   getDataa();
   goToItemsScreen(List categories , int selectedCat , String categoryId);
   search(value);
   onTapSearch();
   getDataSearch();
   goToItemDetailsScreen(ItemsGeneralModel itemsModel);
}
class HomeControllerImp extends HomeController{

  TextEditingController? searchh ;


  MyServices myServices = Get.find();
  String? username;
  HomeData homeData =HomeData(Get.find());
  List data = [];
  List categories = [];
  List items = [];
  List sallingitems = [];
  List offersItem = [];
  List<ItemsGeneralModel> listSearchData = [];
  bool isSearch = false;

  String? lang ;
  late StatusRequest statusRequest;

  @override
  initialData(){
    username = myServices.sharedPreference.getString("username");
    lang = myServices.sharedPreference.getString("Lang");
    searchh = TextEditingController();
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
       for (var item in response['itemsGeneral']) {
        if (int.parse(item['items_discount']) != 0) {
          items.add(item);
        }
         if (int.parse(item['sales_number']) > 5) {
           sallingitems.add(item);
  }
        if (int.parse(item['offers']) != 0) {
          offersItem.add(item);
        }
      }
        
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
  goToItemsScreen(categories , selectedCat , categoryId) {
  Get.to(const ItemsScreen() , transition: Transition.fadeIn , arguments: {
    "categoriesArg" : categories , "slectedCatArd" : selectedCat, "categoryIdArg" : categoryId
  });
  }
  
  @override
  onTapSearch() {
    isSearch = true;
    getDataSearch();
    update();
  }
  
  @override
  search(value) {
    if(value == ""){
      isSearch = false;
    }
    update();
  }
  
  @override
  getDataSearch() async {
     statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(searchh!.text);
    print("==================================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listSearchData.clear();
      List dataSearch = response['data'];
      listSearchData.addAll(dataSearch.map((e) => ItemsGeneralModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }
  
  @override
  goToItemDetailsScreen(ItemsGeneralModel itemsModel) {
    Get.to(const ItemDetailsScreen() , transition: Transition.fadeIn , arguments: {
      "itemModelArg" :itemsModel
    });
  }
  }