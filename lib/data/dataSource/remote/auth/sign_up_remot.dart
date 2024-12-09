

import 'package:e_commerce_app14/core/class/crud.dart';
import 'package:get/get.dart';

import '../../../../link_api.dart';

class SignupData {
  Crud crud = Get.put(Crud());
  
  postdata(String username ,String hashedPassword ,String email , String phone) async {
    var response = await crud.postData(AppLink.signUp, {
      "username" : username , 
      "password" : hashedPassword  , 
      "email" : email , 
      "phone" : phone
    });
    return response.fold((l) => l, (r) => r);
  }
}
