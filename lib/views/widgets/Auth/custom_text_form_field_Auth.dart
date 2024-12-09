
// ignore_for_file: file_names

import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String? labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;

  // ignore: use_super_parameters
  const CustomTextFormAuth(
      {Key? key,
      this.obscureText,
      this.onTapIcon,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      required this.mycontroller,
      required this.valid,
      required this.isNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false  ? false : true,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.3,
              color: AppColor.kBackgroundColorMain),
            borderRadius: BorderRadius.horizontal(right: Radius.circular(10) , left: Radius.circular(10))
          ),
          focusedBorder: const OutlineInputBorder(
           borderSide: BorderSide(color: AppColor.kBackgroundColorMain),
            borderRadius: BorderRadius.horizontal(right: Radius.circular(10) , left: Radius.circular(10))
          ),
          errorBorder: const OutlineInputBorder(
           borderSide: BorderSide(color: Color.fromARGB(255, 186, 33, 22)),
            borderRadius: BorderRadius.horizontal(right: Radius.circular(10) , left: Radius.circular(10))
          ),
          focusedErrorBorder: const OutlineInputBorder(
           borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.horizontal(right: Radius.circular(10) , left: Radius.circular(10))
          ),
          fillColor: Colors.white,
          filled: true,
            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
           
            suffixIcon: InkWell(onTap: onTapIcon, child: Icon(iconData)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}