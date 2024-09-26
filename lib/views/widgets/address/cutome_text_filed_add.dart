import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFieldAddress extends StatelessWidget {
  const CustomTextFieldAddress({super.key, required this.hintText, required this.label , this.mycontroller, this.validator});
  final TextEditingController? mycontroller;
  final String hintText;
  final String label;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
        style: Styles.boldtextStyle16,
        controller: mycontroller,
        decoration: InputDecoration(
          errorStyle: Styles.boldtextStyle12.copyWith(color: Colors.red),
            hintStyle: Styles.boldtextStyle18.copyWith(color: const Color.fromARGB(255, 113, 108, 108)),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                hintText: hintText,
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child:  Text(label  , style: Styles.boldtextStyle16,)), 
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                )
                ),
      );
  }
}