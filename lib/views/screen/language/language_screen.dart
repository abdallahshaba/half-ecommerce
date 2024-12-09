import 'package:e_commerce_app14/core/constant/appRouts.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:e_commerce_app14/core/localization/local_controller.dart';
import 'package:e_commerce_app14/views/widgets/language/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
   LocalController controller = Get.put(LocalController());
    return Scaffold(
      backgroundColor: AppColor.kBackgroundColorMain2,
      body: Container(
        padding: const EdgeInsets.all(15),
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text("1".tr, style: Styles.boldtextStyle26,),
                const SizedBox(height: 15,),
                  Container(
                    padding : const EdgeInsets.symmetric(horizontal: 100),
                    width   : double.infinity,
                    child   : CutomButtonLanguage(
                      onPressed : () {
                          controller.changeLang("ar");
                          Get.toNamed(AppRouts.onBoarding);
                      },
                      textName: "Arabic",
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    width: double.infinity,
                    child: CutomButtonLanguage(
                      onPressed: () {
                          controller.changeLang("en");
                          Get.toNamed(AppRouts.onBoarding);
                      },
                      textName: "English",
                    ),
                  ),
                ],
              ),
            ),
      );
    }
}
