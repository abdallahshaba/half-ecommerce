
import 'package:e_commerce_app14/core/class/crud.dart';
import 'package:e_commerce_app14/link_api.dart';

class CartData {
  Crud crud ;
  CartData(this.crud);

  addCart (userid, itemid)async {
    var response = await crud.postData(AppLink.cartAdd, {
      "userId" : userid,
      "itemId" : itemid
    });
    return response.fold((l) => l, (r) => r);
  }
    deleteCart (userid, itemid)async {
    var response = await crud.postData(AppLink.cartDelete, {
      "userId" : userid,
      "itemId" : itemid
    });
    return response.fold((l) => l, (r) => r);
  }
  getCountOfItemsCart (usersId, itemsId)async {
    var response = await crud.postData(AppLink.cartGetCountOfItems, {
      "usersId" : usersId,
      "itemsId" : itemsId
    });
    return response.fold((l) => l, (r) => r);
  }
  viewCart (userid)async {
    var response = await crud.postData(AppLink.cartView, {
      "userId" : userid,
    });
    return response.fold((l) => l, (r) => r);
  }

   viewItemsCart (userid)async {
    var response = await crud.postData(AppLink.cartitemsView, {
      "userId" : userid,
    });
    return response.fold((l) => l, (r) => r);
  }
  }