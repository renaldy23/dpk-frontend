/*
{
    "id": 2,
    "username": "hello",
    "password": "123",
    "role": 0,
    "phone": "123",
    "email": "janet.weaver@reqres.in",
    "is_active": true,
    "full_name": "Janet",
    "created_at": "2012"
}
*/

class UserModel {
  int? id;
  String? username;
  String? password;
  int? role;
  String? phone;
  String? email;
  bool? isActive;
  String? fullName;
  String? createdAt;

  UserModel({
    this.id,
    this.username,
    this.password,
    this.role,
    this.phone,
    this.email,
    this.isActive,
    this.fullName,
    this.createdAt,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    role = json['role'];
    phone = json['phone'];
    email = json['email'];
    isActive = json['is_active'];
    fullName = json['full_name'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['role'] = this.role;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['is_active'] = this.isActive;
    data['full_name'] = this.fullName;
    data['created_at'] = this.createdAt;
    return data;
  }
}
