class RequestModel {
  String? gender;
  String? kind;
  String? age;
  String? color;
  String? phone;

  RequestModel({
    this.age,
    this.color,
    this.gender,
    this.kind,
    this.phone,
  });
  RequestModel.fromJason(Map<String, dynamic> json) {
    gender = json['gender'];
    kind = json['kind'];
    age = json['age'];
    color = json['color'];
    phone = json['phone'];
  }

  Map<String, dynamic> toMap() {
    return {
      'gender': gender,
      'kind': kind,
      'age': age,
      'color': color,
      'phone': phone,
    };
  }
}
