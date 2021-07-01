import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:about_life/screens/home.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 15, 15, 15),
        primarySwatch: Colors.orange,
        primaryColor: Colors.orange,
        accentColor: Colors.deepPurple[300],
        brightness: Brightness.dark,
        fontFamily: 'Roboto',
      ),
      home: Home(),
    ),
  );
}
