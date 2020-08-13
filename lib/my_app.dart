import 'package:flutter/material.dart';
import 'package:flutter_sy_travel_animation/main_page.dart';
import 'package:flutter_sy_travel_animation/styles.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: mainBlack,
      ),
      home: MainPage(),
    );
  }
}
