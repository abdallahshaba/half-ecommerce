import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app14/controllers/home/home_controller.dart';
import 'package:e_commerce_app14/core/class/handling_data_view.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/data/models/items_general_model.dart';
import 'package:e_commerce_app14/link_api.dart';
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
        body:  ListView(
              children:  [
             const CustomHomeAppBar(),
             const SizedBox(height: 12,),
              Container(
                padding: const EdgeInsets.only(top: 2 , bottom: 15),
                decoration: const BoxDecoration(
                  color:Color(0xFFEDECF2) ,
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
                      child: GetBuilder<HomeControllerImp>(
          builder: (controller) =>  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 45,
                            child:  CustomHomeTextFiled(
                              onPressed: () {
                                controller.onTapSearch();
                              },
                              myController: controller.searchh,
                              onChanged: (value) {
                                controller.search(value);
                              },
                              color: Colors.white,)
                          ),
                        ! controller.isSearch? HandlingDataView(
            statusRequest: controller.statusRequest,
            widget:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                          )) : const ListItemsSearch()
                        ],
                      ),
                    
                  ),
                ),
                ))),
              ],
            ),
          );
  }
}

class ListItemsSearch extends StatelessWidget {
  const ListItemsSearch({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(builder:(controller) => ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.listSearchData.length,
      itemBuilder:(context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SearchResult(itemsGeneralModel: controller.listSearchData[index] ,),
        );
      },
      ),);
  }
}

class SearchResult extends GetView<HomeControllerImp> {
  const SearchResult({super.key, required this.itemsGeneralModel});
  final ItemsGeneralModel itemsGeneralModel;
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return InkWell(
      onTap: () {
        controller.goToItemDetailsScreen(itemsGeneralModel);
      },
      child: Card(
        color: Colors.white,
                      child: SizedBox(
                        height: 100,
                        child: 
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: CachedNetworkImage(
                                                           imageUrl: "${AppLink.imageItems}/${itemsGeneralModel.itemsImage!}" , fit: BoxFit.contain , height: 80,
                                            
                                ),
                              ),),
                             Expanded(
                              flex: 2,
                              child: ListTile(title:  Text("${itemsGeneralModel.itemsName}" , style: Styles.boldtextStyle16,) , subtitle: Text("${itemsGeneralModel.itemsPrice} \$" , style: Styles.boldtextStyle18.copyWith(color: AppColor.kBackgroundColorMain),),)),
                          ]
                        ),
                      ),
                    ),
    );
  }
}