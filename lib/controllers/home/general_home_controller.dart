import 'package:e_commerce_app14/views/screen/cart/cart_screen.dart';
import 'package:e_commerce_app14/views/screen/home/home_screen.dart';
import 'package:e_commerce_app14/views/screen/settings/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class GeneralHomeController extends GetxController{
 changePage(int value);
}

class GeneralHomeControllerImp extends GeneralHomeController{


  int currentPage = 0 ;



 List buttomVavigationTitles = [
    "Home" , "Settings" , "Notify" , "Profile"
 ];


 List<IconData> buttomVavigationIcons = [
   Icons.home_outlined , 
   Icons.settings , 
   Icons.notification_add_outlined,
   Icons.person_2_outlined,
 ];














  List<Widget> listPages = [
    const HomeScreen(),
    const CartScreen(),
    const SettingsScreen(),
    const Column(children: [Center(child: Text("Profile"),),],),];
  
  @override
  changePage(int value) {
    currentPage = value;
    update();
  }
}