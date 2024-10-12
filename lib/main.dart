import 'package:e_commerce_app14/binding/initial_binding.dart';
import 'package:e_commerce_app14/core/localization/local_controller.dart';
import 'package:e_commerce_app14/core/localization/translation.dart';
import 'package:e_commerce_app14/core/services/services.dart';
import 'package:e_commerce_app14/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      locale: controller.language,
      theme: controller.appThem200,
      translations: ChangeLanguage(),
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      getPages: routes
    );
  }
}

