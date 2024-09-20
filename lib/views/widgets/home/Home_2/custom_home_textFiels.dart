import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomHomeTextFiled extends StatelessWidget {
  const CustomHomeTextFiled({super.key, required this.color, this.onChanged, this.myController, this.onPressed});
  final Color color;
  final Function(String)? onChanged;
  final TextEditingController? myController;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController ,
      onChanged: onChanged,
                        decoration: InputDecoration(
                          suffixIcon:  IconButton(onPressed: onPressed, icon: const Icon(Icons.search , color: AppColor.kBackgroundColorMain,)),
                          hintText: "Search here..",
                          contentPadding: const EdgeInsets.only(left: 20),
                          fillColor: color,
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