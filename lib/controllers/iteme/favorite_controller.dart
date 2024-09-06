import 'package:get/get.dart';

class FavoriteController extends GetxController{
  


  Map favorite = {};

  // key => itemId
  // value => 1 OR 0

  setFavorite(itemId , value){
    favorite[itemId] = value;
    update();
  }

}