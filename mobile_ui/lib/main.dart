import 'package:flutter/material.dart';
import 'Login.dart';
import "Home.dart";
import "shenpi.dart";
import "./resetPswrd.dart";
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('zh_CN', null).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "mobile app",
        home: Login(),
        routes: {
          '/home': (context) => Home(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/shenpi') {
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (context) {
                return Shenpi(
                  title: args['title'],
                  name: args['name'],
                  time: args['time'],
                  node: args['node'],
                  token: args['token'],
                  formNum: args['formNum'],
                );
              },
            );
          } else if (settings.name == '/reset') {
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(builder: (context) {
              return Reset(userID: args['userID'], token: args['token']);
            });
          }
        });
  }
}
