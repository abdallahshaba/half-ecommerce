import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/core/constant/imageAsset.dart';
import 'package:e_commerce_app14/core/constant/text_styles.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 10 , left: 15),
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min, // لتقليل المسافة بين العناصر
        crossAxisAlignment: CrossAxisAlignment.center, // لتوسيط العناصر عموديًا
        children: [
          IconButton(
            padding: EdgeInsets.zero, // إزالة أي padding إضافي
            onPressed: () {},
            icon: const Icon(
              Icons.sort,
              size: 40,
              color: AppColor.kBackgroundColorMain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
              height: 40,
              child: Image.asset(
                AppImageAsset.appLogo33,
                  fit: BoxFit.fill, // لضمان أن الصورة تناسب الحاوية
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Badge(
              backgroundColor: Colors.red,
              padding: EdgeInsets.only(left: 4 , right: 3),
              label: Text("10" ,style: Styles.boldtextStyle12,),
              largeSize: 20,
              child: InkWell(
                onTap: () {
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Icon(Icons.shopping_bag_outlined,size: 30,color: AppColor.kBackgroundColorMain,),
                )),
            ),
          )
        ],
      ) );
  }
}