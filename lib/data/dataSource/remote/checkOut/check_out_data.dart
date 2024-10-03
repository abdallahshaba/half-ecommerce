import 'package:e_commerce_app14/core/class/crud.dart';
import 'package:e_commerce_app14/link_api.dart';

class CheckOutData {
  Crud crud ;
  CheckOutData(this.crud);

  checkOutt (data)async {
    var response = await crud.postData(AppLink.checkOut, data);
    return response.fold((l) => l, (r) => r);
  }
}