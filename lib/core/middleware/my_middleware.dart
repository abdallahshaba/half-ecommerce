

// ignore_for_file: body_might_complete_normally_nullable

import 'package:e_commerce_app14/core/constant/appRouts.dart';
import 'package:e_commerce_app14/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? priority = 1;

   MyServices services = Get.put(MyServices());
  @override
  RouteSettings? redirect(String? route){
    if(services.sharedPreference.getString("step")== "2"){
      return const RouteSettings(name: AppRouts.homeScreen);
    }
    if(services.sharedPreference.getString("step")== "1"){
      return const RouteSettings(name: AppRouts.signIn);
    }
    return null;
  }
}