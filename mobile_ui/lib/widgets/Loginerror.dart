import "package:flutter/material.dart";

class Error extends StatelessWidget {
  const Error({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Row(
      children: [
        Text(
          "账号密码错误请重新输入",
          style: TextStyle(
              color: Color(0xFFFF2F54),
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: "PingFang SC"),
          textAlign: TextAlign.start,
        )
      ],
    ));
  }
}
