import 'dart:convert';

List<BeritaModel> beritaModelFromJson(String str) => List<BeritaModel>.from(json.decode(str).map((x) => BeritaModel.fromJson(x)));

String beritaModelToJson(List<BeritaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BeritaModel {
    BeritaModel({
        this.title,
        this.url,
        this.timestamp,
    });

    String title;
    String url;
    int timestamp;

    factory BeritaModel.fromJson(Map<String, dynamic> json) => BeritaModel(
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
