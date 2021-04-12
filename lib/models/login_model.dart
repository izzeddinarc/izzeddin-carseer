// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        this.id,
        this.userName,
        this.password,
    });

    int id;
    dynamic userName;
    dynamic password;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json["id"],
        userName: json["userName"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "password": password,
    };
}
