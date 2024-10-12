
import 'package:e_commerce_app14/core/class/crud.dart';
import 'package:e_commerce_app14/link_api.dart';

class OrdersData {
  Crud crud ;
  OrdersData(this.crud);

  getPendingOrdersData (userId)async {
    var response = await crud.postData(AppLink.pendingOrders, {
      "userId" : userId,
    });
    return response.fold((l) => l, (r) => r);
  }


  getOrderDetailsData (orderId)async {
    var response = await crud.postData(AppLink.orderDetails, {
      "orderId" : orderId,
    });
    return response.fold((l) => l, (r) => r);
  }
}