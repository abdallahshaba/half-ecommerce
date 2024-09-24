import 'package:flutter/material.dart';

class CustomTextFieldCoupon extends StatelessWidget {
  const CustomTextFieldCoupon({super.key, required this.hintText, required this.controllerCoupon});
  final String hintText;
  final TextEditingController? controllerCoupon;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controllerCoupon,
                          decoration:  InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: hintText,
                            contentPadding: const EdgeInsets.symmetric(vertical: 6 , horizontal: 8),
                            isDense: true
                          ),
                        );
  }
}