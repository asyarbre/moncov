import 'package:moncov/consttants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:moncov/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moncov',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
              displayColor: kBlackColor,
            ),
      ),
      home: AnimatedSplashScreen(),
    );
  }
}


