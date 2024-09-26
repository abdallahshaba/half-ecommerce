import 'package:e_commerce_app14/core/class/crud.dart';
import 'package:e_commerce_app14/link_api.dart';

class AddressData {
  Crud crud ;
  AddressData(this.crud);

  addAddress (userId , String city , String street , String name)async {
    var response = await crud.postData(AppLink.addAddress, {
      "userId"  : userId,
      "city"    : city,
      "street"  : street,
      "name"    : name,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewAddress (userId)async {
    var response = await crud.postData(AppLink.viewAddress, {
      "userId"  : userId,
    });
    return response.fold((l) => l, (r) => r);
  }

   deleteAddress (addressId)async {
    var response = await crud.postData(AppLink.deleteAddress, {
      "addresId"  : addressId,
    });
    return response.fold((l) => l, (r) => r);
  }

   editAddress (addresId , city , street , name)async {
    var response = await crud.postData(AppLink.editeAddress, {
      "addresId"  : addresId,
      "city"    : city,
      "street"  : street,
      "name"    : name,
    });
    return response.fold((l) => l, (r) => r);
  }
}