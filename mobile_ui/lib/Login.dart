import 'dart:developer';

import 'package:flutter/material.dart';
import './widgets/Loginerror.dart';
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool fill = false;
  bool result = false;
  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_check);
    _passwordController.addListener(_check);
    _check();
  }

  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _check() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    setState(() {
      fill = username.isNotEmpty && password.isNotEmpty;
    });
  }

  void _submit() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    if (username.isNotEmpty && password.isNotEmpty) {
      Map<String, String> data = {
        "username": username,
        "password": password,
      };
      String dataJSON = jsonEncode(data);
      log(dataJSON);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Wrap the body in SingleChildScrollView
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 240, // predefined height
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('src/images/bg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80),
                  Text(
                    '登录',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF050505),
                      fontFamily: "PingFang TC",
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 44),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage('src/images/icon.png'),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Text(
                              "项目管理系统",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF050505),
                                letterSpacing: 3,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 7),
                            child: Text(
                              "PROJECT MANAGEMENT SYSTEM",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF17181A),
                                fontWeight: FontWeight.w400,
                                fontFamily: "PingFang SC",
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 64),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "账号",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF050505),
                              fontWeight: FontWeight.w400,
                              fontFamily: "PingFang SC",
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 11),
                          TextField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              hintText: '请输入账号',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "PingFang SC",
                                color: Color(0xFFC6C7CC),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFC6C7CC),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF050505),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "密码",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF050505),
                              fontWeight: FontWeight.w400,
                              fontFamily: "PingFang SC",
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 11),
                          TextField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: '请输入密码',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "PingFang SC",
                                color: Color(0xFFC6C7CC),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFC6C7CC),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF050505),
                                ),
                              ),
                            ),
                            obscureText: true,
                          ),
                        ],
                      ),
                      (!result
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 9),
                                Error(),
                              ],
                            )
                          : Container()),
                      SizedBox(height: 64),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: _submit,
                            // Action when button is pressed

                            child: Text(
                              '登录',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "PingFang SC",
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: (fill
                                  ? Color(0xFF0064FF)
                                  : Color(0xFFC6C7CC)),
                              foregroundColor: Color(0xFFFFFFFF),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              fixedSize: Size(315, 48),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 132),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "南京争锋信息科技有限公司",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF17181A),
                              fontWeight: FontWeight.w400,
                              fontFamily: "PingFang SC",
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
