class AddressModel {
  String? addresId;
  String? addresUsersid;
  String? addresCity;
  String? addresName;
  String? addresStreet;

  AddressModel(
      {this.addresId,
      this.addresUsersid,
      this.addresCity,
      this.addresName,
      this.addresStreet});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addresId = json['addres_id'];
    addresUsersid = json['addres_usersid'];
    addresCity = json['addres_city'];
    addresName = json['addres_name'];
    addresStreet = json['addres_street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addres_id'] = this.addresId;
    data['addres_usersid'] = this.addresUsersid;
    data['addres_city'] = this.addresCity;
    data['addres_name'] = this.addresName;
    data['addres_street'] = this.addresStreet;
    return data;
  }
}