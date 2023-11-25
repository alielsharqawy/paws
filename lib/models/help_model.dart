class HelpModel {
  String? gender;
  String? image;
  String? phone;
  String? address;
  String? uId;

  HelpModel({this.gender, this.phone, this.address, this.image, this.uId});
  HelpModel.fromJason(Map<String, dynamic> json) {
    gender = json['gender'];
    phone = json['phone'];
    address = json['address'];
    image = json['image'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'gender': gender,
      'phone': phone,
      'address': address,
      'image': image,
      'uId': uId,
    };
  }
}
