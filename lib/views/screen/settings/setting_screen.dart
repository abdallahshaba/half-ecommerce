import 'package:e_commerce_app14/controllers/settings_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/imageAsset.dart';
import 'package:e_commerce_app14/views/address/view_address.dart';
import 'package:e_commerce_app14/views/screen/orders/archieve.dart';
import 'package:e_commerce_app14/views/screen/orders/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
   SettingsControllerImp controller = Get.put(SettingsControllerImp());
    return Scaffold(
      backgroundColor: AppColor.kBackgroundColorMain2,
      body: ListView(
        children: [
         Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(height: Get.width / 3, color: AppColor.kBackgroundColorMain),
                  Positioned(
                      top: Get.width / 3.9,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey[200],
                          backgroundImage: const AssetImage(AppImageAsset.avatar),
                        ),
                      ),
                      ),
                      Positioned(
                        top: 200,
                        child: Text(" Hi, ${controller.username}" , style: const TextStyle(fontSize: 16),))
                      ]
                      ),
                     const SizedBox(height: 100,),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child:  Card(
                          child: Column(
                            children: [
                              ListTile(
                                title: const Text("Address"),
                                onTap: () { 
                                  Get.to( const ViewAdderssScreen() , transition: Transition.fadeIn);
                                 },
                                trailing: const Icon(Icons.location_on_outlined),
                                ),
                                const Divider(),
                                ListTile(
                                title: const Text("Orders"),
                                onTap: () { 
                                  Get.to( const PendingOrdersScreen() , transition: Transition.fadeIn);
                                 },
                                trailing: const Icon(Icons.shopping_cart_outlined),
                                ),
                              const Divider(),
                                ListTile(
                                title: const Text("Archive"),
                                onTap: () { 
                                  Get.to( const ArchiveOrdersScreen() , transition: Transition.fadeIn);
                                 },
                                trailing: const Icon(Icons.done),
                                ),
                              const Divider(),
                              ListTile(
                                title: const Text("About us"),
                                onTap: () {  },
                                trailing: const Icon(Icons.help_outline_sharp),
                                ),
                             const Divider(),
                              ListTile(
                                title: const Text("Contact us"),
                                onTap: () { 
                                  launchUrl(Uri.parse("Tel:01174652554"));
                                 },
                                trailing: const Icon(Icons.phone_outlined),
                                ),
                               const Divider(),
                                ListTile(
                                title: const Text("Log out"),
                                onTap: () { 
                                  controller.logout();
                                 },
                                trailing: const Icon(Icons.logout_outlined),
                                ),
                            ],
                          ),
                        ),
                      )
        ],
      ),
    );
  }
}