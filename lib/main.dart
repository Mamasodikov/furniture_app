import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_app/bottom_navbar.dart';
import 'package:furniture_app/core/app_constants.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: cBottomBarColor, // navigation bar color
    statusBarColor: cFirstColorDark, // status bar color
  ));
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationPage()));
}
