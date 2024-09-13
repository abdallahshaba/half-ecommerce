import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';

class ListItemsCart extends StatelessWidget {
  const ListItemsCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
                  child: SizedBox(
                    child: 
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Image.asset("assets/images/macpc.png" , height: 100,)),
                         Expanded(
                          flex: 3,
                          child: ListTile(title: const Text("Mac Book M1" , style: Styles.boldtextStyle16,) , subtitle: Text("300.00 \$" , style: Styles.boldtextStyle18.copyWith(color: AppColor.kBackgroundColorMain),),)),
                         Expanded(child: Column(children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
                         const Text("2"),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.remove)),
                        ],))
                      ],
                    ),
                  ),
                );
  }
}