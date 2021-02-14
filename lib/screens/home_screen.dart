import 'package:flutter/material.dart';
import 'package:moncov/berita/halamanutama.dart';
import 'package:moncov/consttants.dart';
import 'package:intl/intl.dart';
import 'package:moncov/api/usermodel.dart';
import 'package:moncov/api/userviewmodel.dart';
import 'package:moncov/screens/provinsi_screens.dart';
import 'package:moncov/berita/hoax/hoax.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //Set the fit size (fill in the screen size of the device in the design) If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    ScreenUtil.init(width: 1080, height: 2340, allowFontScaling: false);

    return HomeScreen();
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

DateTime now = DateTime.now();
String formattedDate = DateFormat('yyyy-MM-dd').format(now);

class _HomeScreenState extends State<HomeScreen> {
  List<UserModel> dataUser = new List();
  void getDataUser() {
    UserViewModel().getUsers().then((value) {
      setState(() {
        dataUser = value;
      });
    });
  }

  final controller = ScrollController();
  double offset = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataUser();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 25.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30.0, left: 30.0),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Kasus Terbaru\n",
                          style: TextStyle(
                              fontSize: ScreenUtil()
                                  .setSp(38, allowFontScalingSelf: true),
                              color: kTitleTextColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins'),
                        ),
                        TextSpan(
                          text: formattedDate,
                          style: TextStyle(
                              fontSize: ScreenUtil()
                                  .setSp(30, allowFontScalingSelf: true),
                              color: Colors.black,
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    child: Text(
                      "Lihat Detail",
                      style: TextStyle(
                        fontSize:
                            ScreenUtil().setSp(40, allowFontScalingSelf: true),
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProvinsiScreen()));
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 30.0, left: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 430.w,
                    height: 300.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFC9977),
                          Color(0xFFF96A2B),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: dataUser == null
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            itemCount: dataUser.length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'TOTAL POSITIF',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: ScreenUtil().setSp(30,
                                              allowFontScalingSelf: true),
                                          height: 1.2,
                                          fontFamily: 'Poppins'),
                                    ),
                                    Container(
                                      width: 5.0,
                                      height: 0,
                                    ),
                                    Text(
                                      dataUser[i].positif,
                                      textAlign: TextAlign.center,
                                      style: data,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                  Container(
                    width: 430.w,
                    height: 300.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFC9090),
                          Color(0xFFFF4848),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: dataUser == null
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            itemCount: dataUser.length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'TOTAL MENINGGAL',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: ScreenUtil().setSp(30,
                                              allowFontScalingSelf: true),
                                          height: 1.2,
                                          fontFamily: 'Poppins'),
                                    ),
                                    Container(
                                      width: 5.0,
                                      height: 0,
                                    ),
                                    Text(
                                      dataUser[i].meninggal,
                                      textAlign: TextAlign.center,
                                      style: data,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 30.0, left: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 430.w,
                    height: 300.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF7BD873),
                          Color(0xFF36C12C),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: dataUser == null
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            itemCount: dataUser.length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'TOTAL SEMBUH',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: ScreenUtil().setSp(30,
                                              allowFontScalingSelf: true),
                                          height: 1.2,
                                          fontFamily: 'Poppins'),
                                    ),
                                    Container(
                                      width: 5.0,
                                      height: 0,
                                    ),
                                    Text(
                                      dataUser[i].sembuh,
                                      textAlign: TextAlign.center,
                                      style: data,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                  Container(
                    width: 430.w,
                    height: 300.h,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF6EB3ED),
                          Color(0xFF3382CC),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: dataUser == null
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            itemCount: dataUser.length,
                            itemBuilder: (context, i) {
                              return ListTile(
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'TOTAL DIRAWAT',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: ScreenUtil().setSp(30,
                                              allowFontScalingSelf: true),
                                          height: 1.2,
                                          fontFamily: 'Poppins'),
                                    ),
                                    Container(
                                      width: 5.0,
                                      height: 0,
                                    ),
                                    Text(
                                      dataUser[i].dirawat,
                                      textAlign: TextAlign.center,
                                      style: data,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, right: 30.0, left: 30.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Cari tahu informasi seputar COVID-19!',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize:
                          ScreenUtil().setSp(35, allowFontScalingSelf: true),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, right: 30.0, left: 30.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HalamanUtama()));
                },
                child: Container(
                  height: 180.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF578DDD),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(right: 5, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Berita Seputar COVID-19\n",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: ScreenUtil()
                                      .setSp(36, allowFontScalingSelf: true),
                                ),
                              ),
                              TextSpan(
                                text: 'Lihat Detail',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontFamily: 'Poppins',
                                  fontSize: ScreenUtil()
                                      .setSp(29, allowFontScalingSelf: true),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 30.0, left: 30.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Hoax()));
                },
                child: Container(
                  height: 180.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF578DDD),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(right: 5, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Waspada Berita HOAX!\n",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: ScreenUtil()
                                      .setSp(36, allowFontScalingSelf: true),
                                ),
                              ),
                              TextSpan(
                                text: 'Lihat Detail',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontFamily: 'Poppins',
                                  fontSize: ScreenUtil()
                                      .setSp(29, allowFontScalingSelf: true),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(right: 30.0, left: 30.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Pusat Layanan COVID-19',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize:
                          ScreenUtil().setSp(35, allowFontScalingSelf: true),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 30.0, left: 30.0),
              child: GestureDetector(
                onTap: () {
                  launch("tel:119");
                },
                child: Container(
                  height: 130.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEFBFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 5),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '119',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: ScreenUtil()
                                  .setSp(45, allowFontScalingSelf: true),
                              fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        Icon(
                          Icons.local_phone,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 30.0, left: 30.0),
              child: GestureDetector(
                onTap: () {
                  launch("tel:021 5210411");
                },
                child: Container(
                  height: 130.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEFBFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 5),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '(021) - 5210 - 411',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: ScreenUtil()
                                  .setSp(45, allowFontScalingSelf: true),
                              fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        Icon(
                          Icons.local_phone,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
