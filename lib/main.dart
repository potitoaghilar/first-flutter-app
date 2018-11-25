import 'package:flutter/material.dart';
import 'package:senseless_app/AppContent.dart';
import 'package:senseless_app/header.dart';
import 'package:senseless_app/image.dart';
import 'package:senseless_app/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'TODO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );

  }

}

class MainPage extends StatelessWidget {

  double _headerHeight = 256.0;
  MainImage mainImage;

  MainPage() {
    mainImage = MainImage(_headerHeight);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: <Widget>[

          AppContent(_headerHeight),
          mainImage,
          Header(mainImage),
          Profile(_headerHeight, "Potito Aghilar", "Developer"),

        ],
      ),
    );

  }

}