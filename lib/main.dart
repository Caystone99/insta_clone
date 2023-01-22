import 'package:flutter/material.dart';
import 'package:insta_clone/pages/loading.dart';
import 'package:insta_clone/pages/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/' : (context) => Loading(),
      '/home': (context) => Home(),
    },
  ));
}
