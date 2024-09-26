import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBackgroundColorMain2,
      appBar: AppBar(
        title: const Text(
          "Check Out",
          style: Styles.boldtextStyle20,
        ),
        centerTitle: true,
        backgroundColor: AppColor.kBackgroundColorMain2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Choose payment method",
              style: Styles.boldtextStyle18,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 1.5, color: AppColor.kBackgroundColorMain),
                  color: Colors.white),
              child: Text("Cash",
                  style: Styles.boldtextStyle16
                      .copyWith(color: AppColor.kBackgroundColorMain)),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: const Text(
                "Payment card",
                style: Styles.boldtextStyle16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Choose delivery type",
              style: Styles.boldtextStyle18,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.5, color: AppColor.kBackgroundColorMain),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Image.asset(
                        "assets/images/006-delivery.png",
                      ),
                    ),
                   const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Delivery",
                      style: Styles.boldtextStyle16
                          .copyWith(color: AppColor.kBackgroundColorMain),
                    )
                  ],
                ),
                // const SizedBox(width: 10,),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 3),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Image.asset(
                        "assets/images/drivethru.png",
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Drive Thru",
                      style: Styles.boldtextStyle16,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
