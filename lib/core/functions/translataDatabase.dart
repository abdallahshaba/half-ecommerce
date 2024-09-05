 
 
 
 import 'package:e_commerce_app14/core/services/services.dart';
import 'package:get/get.dart';

translateDatabase (coulmnAr , coulmnEn){
    MyServices myServices = Get.find();

    if (myServices.sharedPreference.getString("Lang")=="ar") {
      return coulmnAr;
    }
    else {
      return coulmnEn;
    }
}