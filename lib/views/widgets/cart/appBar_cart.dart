import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';

class AppBarCart extends StatelessWidget {
  const AppBarCart({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(top: 10 , left: 10),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child:  Text(title , style: Styles.boldtextStyle24,),
                ),
              ],
            ),
          );
  }
}