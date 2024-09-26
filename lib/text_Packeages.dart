import 'package:e_commerce_app14/core/constant/imageAsset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TestPakeages extends StatefulWidget {
  const TestPakeages({super.key});

  @override
  State<TestPakeages> createState() => _TestPakeagesState();
}

class _TestPakeagesState extends State<TestPakeages> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
              Lottie.asset(AppImageAsset.dataEmpty , width: 300 , height: 300)
          ],
        ),
      ),
      ),
    );
  }
}