import 'package:e_commerce_app14/controllers/address/address_controller.dart';
import 'package:e_commerce_app14/core/class/handling_data_view.dart';
import 'package:e_commerce_app14/core/constant/appRouts.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/data/models/address_model.dart';
import 'package:e_commerce_app14/views/address/add_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAdderssScreen extends StatelessWidget {
  const ViewAdderssScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressController());
    return Scaffold(
      backgroundColor: AppColor.kBackgroundColorMain2,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.kBackgroundColorMain,
        onPressed: (){
          Get.to(const AddAddressScreen() , transition: Transition.fade);
        },
        child: const Icon(Icons.add , color: Colors.white,),
        ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        backgroundColor: AppColor.kBackgroundColorMain,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back), 
              onPressed: () {
                Get.offAllNamed(AppRouts.homeGeneral);
              },
            ),
            title:  Text("Your Addresses" , style: Styles.boldtextStyle20.copyWith(color: Colors.white),),
          ),
      body: GetBuilder<AddressController>(builder:(controller) => HandlingDataView(
        statusRequest: controller.statusRequest, 
        widget:  ListView.builder(
        itemCount: controller.data.length,
        itemBuilder:(context, index) {
        return Lissst(
          i: index,
          addressModel: controller.data[index],
        );
      },
      ),
        ),)
    );
  }
}


class Lissst extends GetView<AddressController> {
  const Lissst({super.key, required this.addressModel, required this.i});
  final AddressModel addressModel;
  final int i;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.all(10),
          child: InkWell(
            onTap: (){
              controller.goToEditAddress(addressModel);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetBuilder<AddressController>(builder:(controller) {
                    return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("Title ${i+1}"),
                        IconButton(onPressed: ()async{
                             await controller.deleteAddress(addressModel.addresId);
                              controller.refreshData();
                            }, icon: const Icon(Icons.delete_forever))
                        ],),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 50,
                        child: Text("${addressModel.addresName} , ${addressModel.addresCity} , ${addressModel.addresStreet}" , style: Styles.boldtextStyle16,),
                      ),
                    ],
                  );
                  },)
                ),
              ),
            ),
          )
        );
  }
}