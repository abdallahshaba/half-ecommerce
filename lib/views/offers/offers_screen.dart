import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/views/widgets/offers/list_offers.dart';
import 'package:flutter/material.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: AppColor.kBackgroundColorMain,
          title: Text("Offers" , style: Styles.boldtextStyle22.copyWith(color: Colors.white),),
        ),
      backgroundColor: AppColor.kBackgroundColorMain2,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ListOffers()
          ],
        ),
      ),
    );
  }
}