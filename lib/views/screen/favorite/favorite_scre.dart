import 'package:e_commerce_app14/controllers/fav/view_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/views/widgets/favorite/gride_view_favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends GetView<MyFavoriteControllerImp> {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp());
    return Scaffold(
       appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: AppColor.kBackgroundColorMain,
          title: Text("Favorites" , style: Styles.boldtextStyle22.copyWith(color: Colors.white),),
        ),
      backgroundColor: AppColor.kBackgroundColorMain2,
      body: Container(
        padding: const EdgeInsets.all(5),
        child: ListView(
          children: const[
          GridViewFavorites()
        ]
        ),
      ),
    );
  }
}
