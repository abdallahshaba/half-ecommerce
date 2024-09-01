import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';

class CutomButtomAppBar extends StatelessWidget {
  const CutomButtomAppBar({super.key, this.onPressed, required this.text, required this.icon, required this.colorTextSelected, required this.iconSelected});
  final void Function()? onPressed;
  final String text;
  final IconData icon;
  final Color colorTextSelected;
  final Color iconSelected;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child:  Column(
        children: [
          Icon(icon, color: iconSelected,),
          Text(text,style: Styles.boldtextStyle12.copyWith(color: colorTextSelected),),
        ],
      ),
    );
  }
}
