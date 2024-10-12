class OrderModel {
  String? ordersId;
  String? ordersAddress;
  String? ordersPrice;
  String? ordersTotalprice;
  String? ordersDeliveryPrice;
  String? ordersPayment;
  String? ordersUserid;
  String? ordersType;
  String? orderState;
  String? ordersCoupon;
  String? ordersTime;
  String? addresId;
  String? addresUsersid;
  String? addresCity;
  String? addresName;
  String? addresStreet;

  OrderModel(
      {this.ordersId,
      this.ordersAddress,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersDeliveryPrice,
      this.ordersPayment,
      this.ordersUserid,
      this.ordersType,
      this.orderState,
      this.ordersCoupon,
      this.ordersTime,
      this.addresId,
      this.addresUsersid,
      this.addresCity,
      this.addresName,
      this.addresStreet});

  OrderModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersAddress = json['orders_address'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersDeliveryPrice = json['orders_deliveryPrice'];
    ordersPayment = json['orders_payment'];
    ordersUserid = json['orders_userid'];
    ordersType = json['orders_type'];
    orderState = json['orders_state'];
    ordersCoupon = json['orders_coupon'];
    ordersTime = json['orders_time'];
    addresId = json['addres_id'];
    addresUsersid = json['addres_usersid'];
    addresCity = json['addres_city'];
    addresName = json['addres_name'];
    addresStreet = json['addres_street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_address'] = this.ordersAddress;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_deliveryPrice'] = this.ordersDeliveryPrice;
    data['orders_payment'] = this.ordersPayment;
    data['orders_userid'] = this.ordersUserid;
    data['orders_type'] = this.ordersType;
    data['orders_state'] = this.orderState;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_time'] = this.ordersTime;
    data['addres_id'] = this.addresId;
    data['addres_usersid'] = this.addresUsersid;
    data['addres_city'] = this.addresCity;
    data['addres_name'] = this.addresName;
    data['addres_street'] = this.addresStreet;
    return data;
  }
}