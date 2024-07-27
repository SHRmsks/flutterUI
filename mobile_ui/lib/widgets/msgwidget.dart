import 'dart:developer';

import 'package:flutter/material.dart';

class MSG extends StatefulWidget {
  final String title;
  final String msg;
  final String time;
  final int index;
  const MSG(
      {Key? key,
      required this.title,
      required this.msg,
      required this.time,
      required this.index});
  @override
  _MSGState createState() => _MSGState();
}

class _MSGState extends State<MSG> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: Offset(0, 0), // changes position of shadow
                      )
                    ]),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('src/images/sysmsg.png'),
                          ConstrainedBox(
                              constraints: BoxConstraints(minWidth: 10)),
                          Wrap(children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.5),
                                    child: Text(
                                      widget.title,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF2D2D2D),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "PingFang SC",
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.5),
                                    child: Text(
                                      widget.msg,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF2D2D2D),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "PingFang SC",
                                          overflow: TextOverflow.ellipsis),
                                    ))
                              ],
                            )
                          ])
                        ]),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.time,
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF2D2D2D),
                                fontWeight: FontWeight.w400,
                                fontFamily: "PingFang SC"),
                          ),
                          SizedBox(height: 20),
                        ])
                  ],
                ),
              )),
          SizedBox(
            height: 7,
          )
        ]);
  }
}
