import 'package:e_commerce_app14/controllers/iteme/item_detai_cont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarCart extends GetView<ItemDetailsControllerImp> {
  const AppBarCart({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    bool fromHome = Get.arguments ?? false;
    return  Container(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      if (!fromHome)
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                      controller.refersh();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
              ),
                      Expanded(
                          child: Container(
                        alignment: Alignment.center,
                        child: Text(
                         title,
                          style: const TextStyle(fontSize: 25),
                        ),
                      )),
                     const Spacer()
                    ],
                  ));
  }
}