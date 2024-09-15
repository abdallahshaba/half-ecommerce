import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/views/widgets/items/buttom_navigation_detai.dart';
import 'package:e_commerce_app14/views/widgets/items/count_and_price_details.dart';
import 'package:e_commerce_app14/views/widgets/items/stack_details_scren.dart';
import 'package:e_commerce_app14/views/widgets/items/title_and_dec_details.dart';
import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ButtomNavigationDetailsScreen(),
      backgroundColor: AppColor.kBackgroundColorMain2,
      body: SizedBox(
        child:  ListView(
            children: const [
             StackDetailsScreen(),
             SizedBox(height: 80,),
             TitleAndDecAndColorDerailsScreen(),
             CountAndPriceDetailsScreen(),
            ],
          ),
        ),
      );
  }
  
}



