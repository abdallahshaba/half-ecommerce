import 'package:e_commerce_app14/controllers/home/general_home_controller.dart';
import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/views/widgets/home/cutom_bottom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CutomeButtomNavigationBar extends StatelessWidget {
  const CutomeButtomNavigationBar({super.key});
  
  @override
  Widget build(BuildContext context) {
    Get.put(GeneralHomeControllerImp());
    return GetBuilder<GeneralHomeControllerImp>(builder:(controller) => SizedBox(
        height: 65,
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Row(
            children: [
              Row(
                children: [
                CutomButtomAppBar(text: "Home", icon: Icons.home, onPressed: () => controller.changePage(0), colorTextSelected: controller.currentPage==0?AppColor.kPrimaryColor:Colors.black, iconSelected: controller.currentPage==0?AppColor.kPrimaryColor:Colors.black,),
                CutomButtomAppBar(text: "Settings", icon: Icons.settings, onPressed: () => controller.changePage(1), colorTextSelected: controller.currentPage==1?AppColor.kPrimaryColor:Colors.black, iconSelected: controller.currentPage==1?AppColor.kPrimaryColor:Colors.black)
                ],
              ),
             const Spacer(),
              Row(
                children: [
                   CutomButtomAppBar(text: "Notify", icon: Icons.notification_add_outlined, onPressed: () => controller.changePage(2), colorTextSelected: controller.currentPage==2?AppColor.kPrimaryColor:Colors.black, iconSelected: controller.currentPage==2?AppColor.kPrimaryColor:Colors.black),
                   CutomButtomAppBar(text: "Profile", icon: Icons.person_2_outlined, onPressed: () => controller.changePage(3), colorTextSelected: controller.currentPage==3?AppColor.kPrimaryColor:Colors.black, iconSelected: controller.currentPage==3?AppColor.kPrimaryColor:Colors.black)
               
                ],
              )
            ],
          ),
        ),
      ),);
  }
}

/////////////////////////////ORRRRRRRRR//////////////////////////////////////


// class CutomeButtomNavigationBar2 extends StatelessWidget {
//   const CutomeButtomNavigationBar2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<GeneralHomeControllerImp>(builder:(controller) => SizedBox(
//         height: 65,
//         child: BottomAppBar(
//           shape: const CircularNotchedRectangle(),
//           child: Row(
//             children: [
//               ...List.generate(controller.listPages.length+1, 
//               (index) {
//                 int i = index>2? index-1 : index;
//               //   return index==2? const Spacer(): CutomButtomAppBar(
//               //  // text: controller.buttomVavigationTitles[i], 
//               //   icon: controller.buttomVavigationIcons[i], 
//               //   onPressed: () => controller.changePage(i), 
//               //   colorTextSelected: controller.currentPage==i?AppColor.kPrimaryColor:Colors.black, 
//               //   iconSelected: controller.currentPage==i?AppColor.kPrimaryColor:Colors.black
//               //   );
//               }
//                 )
//             ],
//           ),
//         ),
//       ),);
//   }
// }