import 'package:e_commerce_app14/controllers/fav/view_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
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
        title: const Text("Favorites"),
      ),
      backgroundColor: AppColor.kBackgroundColorMain2,
      body: Container(
        padding: const EdgeInsets.all(5),
        child: ListView(
          children: [
         const GridViewFavorites()
        ]),
      ),
    );
  }
}
