import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Home Page"),
      ),
      body: Container(
        child: const Center(child: Text("Home" , style: TextStyle(fontSize: 40),),),
      ),
    );
  }
}