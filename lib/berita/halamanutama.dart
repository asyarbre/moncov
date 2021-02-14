import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:moncov/berita/beritascreen.dart';
import 'package:moncov/berita/beritamodel.dart';
import 'package:moncov/berita/beritaviewmodel.dart';
import 'package:moncov/consttants.dart';

class HalamanUtama extends StatefulWidget {
  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  List<BeritaModel> dataBerita = new List();
  void getDataBerita() {
    BeritaViewModel().getBerita().then((value) {
      setState(() {
        dataBerita = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataBerita();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Berita Seputar COVID-19",
          style: appbar,
        ),
        backgroundColor: Color(0xFF578DDD),
      ),
      body: dataBerita == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: dataBerita.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BeritaScreen(
                                  selectedUrl: dataBerita[i].url,
                                )));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            dataBerita[i].title,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: ScreenUtil()
                                  .setSp(35, allowFontScalingSelf: true),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
