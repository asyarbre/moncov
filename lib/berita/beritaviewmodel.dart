import 'package:http/http.dart' as http;
import 'package:moncov/berita/beritamodel.dart';

class BeritaViewModel {

  Future<List<BeritaModel>> getBerita() async {
    try {
      http.Response hasil = await http.get(
          Uri.encodeFull("https://dekontaminasi.com/api/id/covid19/news"),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
        print("data category success");
        final data = beritaModelFromJson(hasil.body);
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