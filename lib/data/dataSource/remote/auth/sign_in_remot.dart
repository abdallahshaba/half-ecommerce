

import 'package:e_commerce_app14/core/class/crud.dart';
import 'package:get/get.dart';

import '../../../../link_api.dart';

class SignInData {
  Crud crud = Get.put(Crud());
  
  postdata(String email ,String password) async {
    var response = await crud.postData(AppLink.signIn, {
      "email" : email , 
      "password" : password  , 
    });
    return response.fold((l) => l, (r) => r);
  }
}
