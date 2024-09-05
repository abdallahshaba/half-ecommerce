import 'package:e_commerce_app14/controllers/home/home_controller.dart';
import 'package:e_commerce_app14/core/class/handling_data_view.dart';
import 'package:e_commerce_app14/views/widgets/home/Home_2/custom_home_appBar.dart';
import 'package:e_commerce_app14/views/widgets/home/Home_2/custom_home_textFiels.dart';
import 'package:e_commerce_app14/views/widgets/home/custom_list_categories.dart';
import 'package:e_commerce_app14/views/widgets/home/custom_list_offers.dart';
import 'package:e_commerce_app14/views/widgets/home/custom_list_productForYou.dart';
import 'package:e_commerce_app14/views/widgets/home/custom_list_salling.dart';
import 'package:e_commerce_app14/views/widgets/home/custom_title.dart';
import 'package:e_commerce_app14/views/widgets/home/offers_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
        body: GetBuilder<HomeControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children:  [
             const CustomHomeAppBar(),
             const SizedBox(height: 12,),
              Container(
                padding: const EdgeInsets.only(top: 2 , bottom: 15),
                decoration: const BoxDecoration(
                  color: Color(0xFFEDECF2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 45,
                            child: const CustomHomeTextFiled(color: Colors.white,)
                          ),
                          const SizedBox(height: 20,),
                          const OffersWidgets(),
                          const SizedBox(height: 20,),
                           CustomTitle(text: "${39}".tr),
                          const SizedBox(height: 10,),
                          const CustomListCategoriesHome(),
                          const SizedBox(height: 10,),
                          const CustomTitle(text: "Products for you"),
                          const SizedBox(height: 10,),
                          const CustomListProductForYou(),
                          const SizedBox(height: 10,),
                          const CustomTitle(text: "Best selling products"),
                          const SizedBox(height: 10,),
                          const CustomListBestSalling(),
                          const SizedBox(height: 10,),
                          const CustomTitle(text: "Offers"),
                          const SizedBox(height: 0,),
                          const CustomListOffers(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ],
            ),
          ),
        )
        );
  }
}