import 'package:e_commerce_app14/views/widgets/home/custom_appbar.dart';
import 'package:flutter/material.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20 , left: 20 , right: 20),
        child: ListView(
          children: [
            const CustomAppBarHomeScreen(hintText: "Find Product"),
          ],
        ),
      ),
    );
  }
}