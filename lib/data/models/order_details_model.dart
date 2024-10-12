class OrdersDetailsModel {
  String? totalPrice;
  String? totalItems;
  String? cartId;
  String? cartUsersId;
  String? cartItemsId;
  String? cardOrders;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCategories;
  String? salesNumber;
  String? offers;
  String? newPrice;
  String? ordersId;
  String? ordersUserid;
  String? ordersType;
  String? ordersCoupon;
  String? ordersPayment;
  String? ordersPrice;
  String? ordersTotalprice;
  String? ordersAddress;
  String? ordersDeliveryPrice;
  String? ordersState;
  String? ordersData;
  String? addresId;
  String? addresUsersid;
  String? addresCity;
  String? addresName;
  String? addresStreet;

  OrdersDetailsModel(
      {this.totalPrice,
      this.totalItems,
      this.cartId,
      this.cartUsersId,
      this.cartItemsId,
      this.cardOrders,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCategories,
      this.salesNumber,
      this.offers,
      this.newPrice,
      this.ordersId,
      this.ordersUserid,
      this.ordersType,
      this.ordersCoupon,
      this.ordersPayment,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersAddress,
      this.ordersDeliveryPrice,
      this.ordersState,
      this.ordersData,
      this.addresId,
      this.addresUsersid,
      this.addresCity,
      this.addresName,
      this.addresStreet});

  OrdersDetailsModel.fromJson(Map<String, dynamic> json) {
    totalPrice = json['totalPrice'];
    totalItems = json['totalItems'];
    cartId = json['cart_id'];
    cartUsersId = json['cart_users_id'];
    cartItemsId = json['cart_items_id'];
    cardOrders = json['card_orders'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCategories = json['items_categories'];
    salesNumber = json['sales_number'];
    offers = json['offers'];
    newPrice = json['new_price'];
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersType = json['orders_type'];
    ordersCoupon = json['orders_coupon'];
    ordersPayment = json['orders_payment'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersAddress = json['orders_address'];
    ordersDeliveryPrice = json['orders_deliveryPrice'];
    ordersState = json['orders_state'];
    ordersData = json['orders_data'];
    addresId = json['addres_id'];
    addresUsersid = json['addres_usersid'];
    addresCity = json['addres_city'];
    addresName = json['addres_name'];
    addresStreet = json['addres_street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPrice'] = this.totalPrice;
    data['totalItems'] = this.totalItems;
    data['cart_id'] = this.cartId;
    data['cart_users_id'] = this.cartUsersId;
    data['cart_items_id'] = this.cartItemsId;
    data['card_orders'] = this.cardOrders;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_categories'] = this.itemsCategories;
    data['sales_number'] = this.salesNumber;
    data['offers'] = this.offers;
    data['new_price'] = this.newPrice;
    data['orders_id'] = this.ordersId;
    data['orders_userid'] = this.ordersUserid;
    data['orders_type'] = this.ordersType;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_payment'] = this.ordersPayment;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_address'] = this.ordersAddress;
    data['orders_deliveryPrice'] = this.ordersDeliveryPrice;
    data['orders_state'] = this.ordersState;
    data['orders_data'] = this.ordersData;
    data['addres_id'] = this.addresId;
    data['addres_usersid'] = this.addresUsersid;
    data['addres_city'] = this.addresCity;
    data['addres_name'] = this.addresName;
    data['addres_street'] = this.addresStreet;
    return data;
  }
}