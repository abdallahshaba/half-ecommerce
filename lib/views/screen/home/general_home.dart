import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';

class HomeGeneral extends StatelessWidget {
  const HomeGeneral({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100)
          )  ,
          onPressed: (){} , child: const Icon(Icons.shopping_basket_sharp),),
      ),
      bottomNavigationBar: SizedBox(
        height: 65,
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            children: [
              Row(
                children: [
                MaterialButton(onPressed: (){} , child: const Column(children: [Icon(Icons.home) , Text("Home" , style: Styles.boldtextStyle12,)],),),
                MaterialButton(onPressed: (){} , child: const Column(children: [Icon(Icons.home) , Text("Home" , style: Styles.boldtextStyle12,)],),),
                ],
              ),
             const Spacer(),
              Row(
                children: [
                MaterialButton(onPressed: (){} , child: const Column(children: [Icon(Icons.home) , Text("Home" , style: Styles.boldtextStyle12,)],),),
                MaterialButton(onPressed: (){} , child: const Column(children: [Icon(Icons.home) , Text("Home" , style: Styles.boldtextStyle12,)],),),
                ],
              )
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text("General Home"),
      ),
    );
  }
}