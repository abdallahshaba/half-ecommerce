import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app14/controllers/iteme/item_controller.dart';
import 'package:e_commerce_app14/core/class/handling_data_view.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/imageAsset.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/data/models/items_general_model.dart';
import 'package:e_commerce_app14/link_api.dart';
import 'package:e_commerce_app14/views/widgets/home/Home_2/custom_home_textFiels.dart';
import 'package:e_commerce_app14/views/widgets/items/categories_itemPage.dart';
import 'package:e_commerce_app14/views/widgets/items/gride_view_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
 ItemsControllerImp itemsControllerImp = Get.put(ItemsControllerImp());
    return GetBuilder<ItemsControllerImp>(builder:(controller) {
      return Scaffold(
      backgroundColor: AppColor.kBackgroundColorMain2,
      body: Padding(
        padding: const EdgeInsets.only(top: 5 , left: 20 , right: 20),
        child:  ListView(
          children: [
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(child: CustomHomeTextFiled(
                    onPressed: () {
                      itemsControllerImp.onTapSearch();
                    },
                  onChanged: (value) {
                    itemsControllerImp.search(value);
                  },
                  myController:  itemsControllerImp.searchh,
                  color: Colors.white,)) , 
                 const SizedBox(width: 10,),
                  SizedBox(
                    height: 50,
                    child: Image.asset(AppImageAsset.appLogoSign))
                ],
              ),
            ),
         ! itemsControllerImp.isSearch? Column(
            children: [
              const SizedBox(height: 5,),
           Container(
            width: double.infinity,
            child: const CategoriesItemPage()),
           const SizedBox(height: 20,),
          GetBuilder<ItemsControllerImp>(builder:(controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
             widget:  const GridViewItems())
             ,)
            ],
           ) : ListItemsSearch()
          ],
        ),
          )
          ,);
    },);
  }
}




class ListItemsSearch extends StatelessWidget {
  const ListItemsSearch({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(builder:(controller) => ListView.builder(
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

class SearchResult extends GetView<ItemsControllerImp> {
  const SearchResult({super.key, required this.itemsGeneralModel});
  final ItemsGeneralModel itemsGeneralModel;
  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
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




