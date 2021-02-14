// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
    UserModel({
        this.name,
        this.positif,
        this.sembuh,
        this.meninggal,
        this.dirawat,
    });

    String name;
    String positif;
    String sembuh;
    String meninggal;
    String dirawat;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        positif: json["positif"],
        sembuh: json["sembuh"],
        meninggal: json["meninggal"],
        dirawat: json["dirawat"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "positif": positif,
        "sembuh": sembuh,
        "meninggal": meninggal,
        "dirawat": dirawat,
    };
}
