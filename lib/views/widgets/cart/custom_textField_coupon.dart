import 'package:flutter/material.dart';

class CustomTextFieldCoupon extends StatelessWidget {
  const CustomTextFieldCoupon({super.key, required this.hintText, required this.controllerCoupoon});
  final String hintText;
  final TextEditingController controllerCoupoon;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controllerCoupoon,
                          decoration:  InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: hintText,
                            contentPadding: const EdgeInsets.symmetric(vertical: 6 , horizontal: 8),
                            isDense: true
                          ),
                        );
  }
}