
import 'package:e_commerce_app14/core/class/crud.dart';
import 'package:e_commerce_app14/link_api.dart';

class CouponsData {
  Crud crud ;
  CouponsData(this.crud);

  getCouponData (coupon)async {
    var response = await crud.postData(AppLink.checkcoupon, {
      "couponneme" : coupon
    });
    return response.fold((l) => l, (r) => r);
  }
}