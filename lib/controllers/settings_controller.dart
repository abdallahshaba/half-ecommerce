import 'package:e_commerce_app14/core/constant/appRouts.dart';
import 'package:e_commerce_app14/core/services/services.dart';
import 'package:get/get.dart';

abstract class SettingsController extends GetxController{
  logout();
}

class SettingsControllerImp extends SettingsController{
  MyServices myServices = Get.find();
  @override
  logout() {
    myServices.sharedPreference.clear();
    Get.offAllNamed(AppRouts.signIn);
  }

}