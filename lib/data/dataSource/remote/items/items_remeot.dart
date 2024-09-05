import 'package:e_commerce_app14/core/class/crud.dart';
import 'package:e_commerce_app14/link_api.dart';

class ItemData {
  Crud crud ;
  ItemData(this.crud);

  getData (categoryId)async {
    var response = await crud.postData(AppLink.itemsPage, {
      "id" : categoryId 
    });
    return response.fold((l) => l, (r) => r);
  }
}