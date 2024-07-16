import 'dart:developer';
import 'package:flutter/material.dart';

class Daiban extends StatefulWidget {
  final String title;
  final String name;
  final String time;
  final String task;
  @override
  const Daiban(
      {super.key,
      required String this.title,
      required String this.name,
      required String this.time,
      required String this.task});
  @override
  _DaibanState createState() => _DaibanState();
}

class _DaibanState extends State<Daiban> {
  bool _shenpi = false;

  void _shenpihandler() {
    setState(() => _shenpi = true);
    if (_shenpi == true) {
      Navigator.pushNamed(context, '/shenpi');
    }
  }

  @override
  Widget build(BuildContext context) {
    return (SizedBox(
        height: 134.5,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(widget.title,
                    style: TextStyle(
                        color: Color(0xFF050505),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "PingFang SC"),
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Row(children: [
                    Image.asset('src/images/user.png'),
                    Text(widget.name,
                        style: TextStyle(
                            color: Color(0xFF46484D),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: "PingFang SC"),
                        overflow: TextOverflow.ellipsis)
                  ]))
                ],
              )),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('src/images/task.png'),
                  Expanded(
                      child: Text(widget.task,
                          style: TextStyle(
                              color: Color(0xFF46484D),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontFamily: "PingFang SC"),
                          overflow: TextOverflow.ellipsis))
                ],
              )),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('src/images/time.png'),
                  Expanded(
                      child: Text(widget.time,
                          style: TextStyle(
                              color: Color(0xFF46484D),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontFamily: "PingFang SC"),
                          overflow: TextOverflow.ellipsis))
                ],
              ))
            ],
          ),
          Divider(
            color: Color(0xFFF0F0F2),
            height: 1,
          ),
          ElevatedButton(
              onPressed: _shenpihandler,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("src/images/shenpi.png"),
                  SizedBox(width: 2),
                  Text("审批",
                      style: TextStyle(
                          color: Color(0xFF17181A),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          fontFamily: "PingFang SC"),
                      textAlign: TextAlign.center),
                ],
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF7F8FA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ))),
        ])));
  }
}
