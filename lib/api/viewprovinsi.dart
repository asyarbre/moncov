import 'dart:convert';
import 'package:moncov/api/provinsimodel.dart';
import 'package:http/http.dart' as http;

class Viewprovinsi {

  Future<List<ProvinsiModel>> getUsers() async {
    try {
      http.Response hasil = await http.get(
          Uri.encodeFull("https://api.kawalcorona.com/indonesia/"),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        print("data category success");
        final data = provinsiModelFromJson(hasil.body);
        return data;
      } else {
        print("error status " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catch $e");
      return null;
    }
  }
}