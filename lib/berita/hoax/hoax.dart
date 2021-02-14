import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:moncov/berita/hoax/hoaxmodel.dart';
import 'package:moncov/berita/hoax/hoaxviewmodel.dart';
import 'package:moncov/berita/hoax/hoaxscreen.dart';
import 'package:moncov/consttants.dart';

class Hoax extends StatefulWidget {
  @override
  _HoaxState createState() => _HoaxState();
}

class _HoaxState extends State<Hoax> {
  List<HoaxModel> dataBerita = new List();
  void getDataBerita() {
    HoaxViewModel().getBerita().then((value) {
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
          "Waspada Berita HOAX!",
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
                            builder: (context) => HoaxScreen(
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
