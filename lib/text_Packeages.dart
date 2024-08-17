import 'package:flutter/material.dart';

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
              
          ],
        ),
      ),
      ),
    );
  }
}