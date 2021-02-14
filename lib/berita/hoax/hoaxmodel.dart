// To parse this JSON data, do
//
//     final hoaxModel = hoaxModelFromJson(jsonString);

import 'dart:convert';

List<HoaxModel> hoaxModelFromJson(String str) => List<HoaxModel>.from(json.decode(str).map((x) => HoaxModel.fromJson(x)));

String hoaxModelToJson(List<HoaxModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HoaxModel {
    HoaxModel({
        this.title,
        this.url,
        this.timestamp,
    });

    String title;
    String url;
    int timestamp;

    factory HoaxModel.fromJson(Map<String, dynamic> json) => HoaxModel(
        title: json["title"],
        url: json["url"],
        timestamp: json["timestamp"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
        "timestamp": timestamp,
    };
}
