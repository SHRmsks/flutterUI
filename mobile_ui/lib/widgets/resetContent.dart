import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import "package:http/http.dart" as http;
import "dart:convert";

class Resetcontent extends StatefulWidget {
  final String token;
  final String userID;
  Resetcontent({super.key, required this.token, required this.userID});
  @override
  _ResetcontentState createState() => _ResetcontentState();
}

class _ResetcontentState extends State<Resetcontent> {
  final TextEditingController _id = TextEditingController();
  final TextEditingController _old = TextEditingController();
  final TextEditingController _new = TextEditingController();
  final TextEditingController _new2 = TextEditingController();

  bool _isloading = false;
  void _savehandler() {
    String id = _id.text;
    String old = _old.text;
    String newp = _new.text;
    String newp2 = _new2.text;
    if (id.isNotEmpty &&
        old.isNotEmpty &&
        newp.isNotEmpty &&
        newp2.isNotEmpty &&
        newp == newp2) {
      log("old" + old);
      log("newp" + newp);
      log("newp2" + newp2);
      setState(() => _isloading = true);

      _submitHandler(old, newp, newp2).then((status) {
        setState(() => _isloading = false);
        if (status) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              '修改密码成功',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 14,
                fontFamily: "PingFang SC",
                fontWeight: FontWeight.w500,
              ),
            ),
            duration: Duration(milliseconds: 300),
            backgroundColor: Color(0xFFBBBED0),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              '无法修改，请再次核对密码',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 14,
                fontFamily: "PingFang SC",
                fontWeight: FontWeight.w500,
              ),
            ),
            duration: Duration(milliseconds: 300),
            backgroundColor: Color(0xFFBBBED0),
          ));
        }
      }).catchError((error) {
        setState(() => _isloading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                '连接失败，请稍后尝试',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 14,
                  fontFamily: "PingFang SC",
                  fontWeight: FontWeight.w500,
                ),
              ),
              duration: Duration(milliseconds: 300),
              backgroundColor: Color(0xFFBBBED0)),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '请正确填写密码',
            style: TextStyle(
              color: Color(0xFFC6C7CC),
              fontSize: 14,
              fontFamily: "PingFang SC",
              fontWeight: FontWeight.w500,
            ),
          ),
          duration: Duration(milliseconds: 300),
          backgroundColor: Color(0xFFBBBED0),
        ),
      );
    }
  }

  Future<bool> _submitHandler(String old, String newp, String newp2) async {
    final url = Uri.parse(
        'http://223.68.128.86:28218/manage/ServletCtrl?uuid=&token=' +
            widget.token);
    final header = {"content-type": "text/html;charset=UTF-8"};
    Map<String, dynamic> data = {
      "name": "com.zfkj.core.User.modifyPassword",
      "data": {
        "user_id": widget.userID,
        "old_password": old,
        "new_password": newp,
        "confirm_new_password": newp2,
      }
    };
    final jsondata = jsonEncode(data);
    final response = await http.post(url, headers: header, body: jsondata);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(Uri.decodeComponent(response.body));
      log(jsonEncode(responseData));
      return responseData["success"];
    } else {
      throw Exception('Failed to connect');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "工号",
                        style: TextStyle(
                          color: Color(0xFF050505),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: "PingFang SC",
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 200,
                        ),
                        child: TextField(
                          controller: _id,
                          decoration: InputDecoration(
                            hintText: "请输入工号",
                            hintStyle: TextStyle(
                              color: Color(0xFFC6C7CC),
                              fontSize: 14,
                              fontFamily: "PingFang SC",
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Color(0xFFF0F0F2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "旧密码",
                        style: TextStyle(
                          color: Color(0xFF050505),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: "PingFang SC",
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 200,
                        ),
                        child: TextField(
                          controller: _old,
                          decoration: InputDecoration(
                            hintText: "请输入旧密码",
                            hintStyle: TextStyle(
                              color: Color(0xFFC6C7CC),
                              fontSize: 14,
                              fontFamily: "PingFang SC",
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Color(0xFFF0F0F2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "新密码",
                        style: TextStyle(
                          color: Color(0xFF050505),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: "PingFang SC",
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 200,
                        ),
                        child: TextField(
                          controller: _new,
                          decoration: InputDecoration(
                            hintText: "请输入新密码",
                            hintStyle: TextStyle(
                              color: Color(0xFFC6C7CC),
                              fontSize: 14,
                              fontFamily: "PingFang SC",
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Color(0xFFF0F0F2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "确认新密码",
                        style: TextStyle(
                          color: Color(0xFF050505),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: "PingFang SC",
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 200,
                        ),
                        child: TextField(
                          controller: _new2,
                          decoration: InputDecoration(
                            hintText: "请再次输入新密码",
                            hintStyle: TextStyle(
                              color: Color(0xFFC6C7CC),
                              fontSize: 14,
                              fontFamily: "PingFang SC",
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                          obscureText: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ElevatedButton(
                onPressed: _savehandler,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('src/images/save.png'),
                    SizedBox(width: 7),
                    Text(
                      "保存修改",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        fontFamily: "PingFang SC",
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0064FF),
                  minimumSize: Size(300, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
