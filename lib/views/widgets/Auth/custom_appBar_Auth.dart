import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBarAuth extends StatelessWidget {
  const CustomAppBarAuth({super.key, required this.text, this.onTap, this.iconData});
  final String text;
  final Function()? onTap;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onTap,
             child: Icon(iconData)),
             Padding(
              padding: const EdgeInsets.only(left: 125),
              child: Text(
               text,
                style: Styles.boldtextStyle22,
              ),
            )
          ],
        ),
      );
  }
}
