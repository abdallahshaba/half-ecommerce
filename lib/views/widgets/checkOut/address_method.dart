import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';

class AddressMethodCheckOut extends StatelessWidget {
  const AddressMethodCheckOut({super.key, required this.address, required this.home, required this.isActive});
  final String address;
  final String home;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Card(
              shape:  RoundedRectangleBorder(
                side: BorderSide(
                  width: 1.5 , color: isActive==true? AppColor.kBackgroundColorMain : Colors.white
                )
              ),
              child: ListTile(
                title: Text(home , style: Styles.boldtextStyle16.copyWith(color: isActive==true? AppColor.kBackgroundColorMain : Colors.black)),
                subtitle: Text(address , style: Styles.boldtextStyle14.copyWith(color: isActive==true? AppColor.kBackgroundColorMain : Color.fromARGB(255, 73, 73, 73)),),
              ),
             );
  }
}