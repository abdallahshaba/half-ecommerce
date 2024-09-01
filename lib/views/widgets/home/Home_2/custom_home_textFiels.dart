import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomHomeTextFiled extends StatelessWidget {
  const CustomHomeTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.camera_alt_outlined , color: AppColor.kBackgroundColorMain,),
                          hintText: "Search here..",
                          contentPadding: const EdgeInsets.only(left: 20),
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none
                          ),
                        ),
                      );
  }
}