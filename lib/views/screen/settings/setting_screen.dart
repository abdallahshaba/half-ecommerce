import 'package:e_commerce_app14/controllers/settings_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/imageAsset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
   SettingsControllerImp controller = Get.put(SettingsControllerImp());
    return ListView(
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
                        backgroundColor: Colors.grey[100],
                        backgroundImage: const AssetImage(AppImageAsset.avatar),
                      ),
                    ))]),
                   const SizedBox(height: 100,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child:  Card(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text("Address"),
                              onTap: () {  },
                              trailing: Icon(Icons.location_on_outlined),
                              ),
                            Divider(),
                            ListTile(
                              title: Text("About us"),
                              onTap: () {  },
                              trailing: Icon(Icons.help_outline_sharp),
                              ),
                            Divider(),
                            ListTile(
                              title: Text("Contact us"),
                              onTap: () {  },
                              trailing: Icon(Icons.phone_outlined),
                              ),
                              Divider(),
                              ListTile(
                              title: Text("Log out"),
                              onTap: () { 
                                controller.logout();
                               },
                              trailing: Icon(Icons.logout_outlined),
                              ),
                          ],
                        ),
                      ),
                    )
      ],
    );
  }
}