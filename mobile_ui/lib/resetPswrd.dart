import "package:flutter/material.dart";
import './widgets/shenpiback.dart';
import './widgets/resetContent.dart';

class Reset extends StatefulWidget {
  final String userID;
  final String token;
  const Reset({super.key, required this.userID, required this.token});
  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: Stack(children: [
      Positioned(
          left: 0,
          right: 0,
          top: 32,
          child: Container(
              color: Color(0xFFFFFFFF),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SPback(backName: "修改密码"),
                  Resetcontent(token: widget.token, userID: widget.userID),
                ],
              )))
    ])));
  }
}
