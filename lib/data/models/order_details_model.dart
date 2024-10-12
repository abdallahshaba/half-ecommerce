class OrderDetailsModel {
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

  OrderDetailsModel(
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
      this.newPrice});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}