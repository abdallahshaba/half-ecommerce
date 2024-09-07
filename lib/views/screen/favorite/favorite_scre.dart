import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),
      backgroundColor: AppColor.kBackgroundColorMain2,
      body: Container(
        padding: const EdgeInsets.all(5),
        child: ListView(
          children: [
            
          ],
        ),
      ),
    );
  }
}