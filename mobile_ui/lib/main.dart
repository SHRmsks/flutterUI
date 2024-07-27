import 'package:flutter/material.dart';
import 'Login.dart';
import "Home.dart";
import "shenpigs.dart";
import "./resetPswrd.dart";
import 'package:intl/date_symbol_data_local.dart';
import 'shenpixm.dart';
import 'shenpify.dart';
import './Msg.dart';

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
          if (settings.name == '/shenpigs') {
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
          } else if (settings.name == '/message') {
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(builder: (context) {
              return Message(userID: args['userID'], token: args['token']);
            });
          } else if (settings.name == '/shenpixm') {
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(builder: (context) {
              return Shenpixm(
                title: args['title'],
                name: args['name'],
                time: args['time'],
                node: args['node'],
                token: args['token'],
                formNum: args['formNum'],
                userID: args['userID'],
                username: args['username'],
                dept_id: args['dept_id'],
                dept_name: args['dept_name'],
                uuid: args['uuid'],
              );
            });
          } else if (settings.name == '/shenpify') {
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(builder: (context) {
              return Shenpify(
                title: args['title'],
                name: args['name'],
                time: args['time'],
                node: args['node'],
                token: args['token'],
                formNum: args['formNum'],
              );
            });
          }
        });
  }
}
