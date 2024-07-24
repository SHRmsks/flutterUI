import 'dart:developer';
import 'package:flutter/material.dart';

class Daiban extends StatefulWidget {
  final String title;
  final String name;
  final String time;
  final String task;
  final String formNum;
  final String token;
  final String workflow_no;
  @override
  const Daiban(
      {super.key,
      required this.title,
      required this.name,
      required this.time,
      required this.task,
      required this.formNum,
      required this.token,
      required this.workflow_no});
  @override
  _DaibanState createState() => _DaibanState();
}

class _DaibanState extends State<Daiban> {
  bool _shenpigs = false;
  bool _shenpixm = false;
  void _shenpigshandler() {
    setState(() => _shenpigs = true);
    if (_shenpigs == true) {
      Navigator.pushNamed(
        context,
        '/shenpigs',
        arguments: {
          'title': widget.title,
          'name': widget.name,
          'time': widget.time,
          'node': widget.task,
          'token': widget.token,
          'formNum': widget.formNum,
        },
      );
    }
  }

  void _shenpixmhandler() {
    setState(() => _shenpixm = true);
    if (_shenpixm == true) {
      Navigator.pushNamed(
        context,
        '/shenpixm',
        arguments: {
          'title': widget.title,
          'name': widget.name,
          'time': widget.time,
          'node': widget.task,
          'token': widget.token,
          'formNum': widget.formNum,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // log(widget.task);
    // log(widget.name);
    // log(widget.time);
    // log(widget.task);
    // log(widget.token);
    log(widget.formNum);
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
              onPressed: widget.workflow_no== "gsfpsh"
                  ? _shenpigshandler
                  : widget.workflow_no == "lxsqsq"
                      ? _shenpixmhandler
                      : () {},
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
