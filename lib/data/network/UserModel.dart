class UserModel {
  String id;
  String name;
  String picture;
  int coin;
  String code;
  String email;
  String createdAt;

  UserModel(
      {this.id,
      this.name,
      this.picture,
      this.coin,
      this.code,
      this.email,
      this.createdAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picture = json['picture'];
    coin = json['coin'];
    code = json['code'];
    email = json['email'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['coin'] = this.coin;
    data['code'] = this.code;
    data['email'] = this.email;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
