import 'package:http/http.dart' as http;
import 'package:moncov/berita/hoax/hoaxmodel.dart';

class HoaxViewModel {

  Future<List<HoaxModel>> getBerita() async {
    try {
      http.Response hasil = await http.get(
          Uri.encodeFull("https://dekontaminasi.com/api/id/covid19/hoaxes"),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        print("data category success");
        final data = hoaxModelFromJson(hasil.body);
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