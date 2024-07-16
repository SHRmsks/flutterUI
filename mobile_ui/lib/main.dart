import 'package:flutter/material.dart';
import 'Login.dart';
import "Home.dart";
import "shenpi.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "mobile app", home: Login(), routes: {
      '/home': (context) => Home(),
      '/shenpi': (context)=> Shenpi(),
    });
  }
}
