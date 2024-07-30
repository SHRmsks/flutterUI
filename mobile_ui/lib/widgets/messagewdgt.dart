import 'dart:developer';
import 'package:flutter/material.dart';

class MessageWidget extends StatefulWidget {
  final String content;
  final String time;
  const MessageWidget({super.key, required this.content, required this.time});

  @override
  _MessageWidgetState createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  late String PmAm;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    (int.parse(widget.time.substring(11, 13)) < 12) ? PmAm = 'AM' : PmAm = 'PM';
  }

  @override
  Widget build(BuildContext context) {
    return (Column(children: [
      SizedBox(height: 15),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(width: 46),
            Text(
              widget.time.substring(11, 16) + " " + PmAm,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF2D2D2D),
                fontWeight: FontWeight.w600,
                fontFamily: "PingFang SC",
              ),
            ),
          ]),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('src/images/sysMsgR.png'),
                  ],
                ),
                SizedBox(
                  width: 6,
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 11),
                  child: Text(
                    widget.content,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF2D2D2D),
                      fontWeight: FontWeight.w600,
                      fontFamily: "PingFang SC",
                    ),
                    softWrap: true,
                  ),
                )),
              ])
        ],
      ),
    ]));
  }
}
