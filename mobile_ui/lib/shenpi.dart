import './widgets/shenpitool.dart';
import "package:flutter/material.dart";
import './widgets/shenpiback.dart';
import './widgets/shenpicontent.dart';
import "./widgets/shenpitask.dart";

class Shenpi extends StatefulWidget {
  const Shenpi({super.key});
  @override
  _ShenpiState createState() => _ShenpiState();
}

class _ShenpiState extends State<Shenpi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    SPback(),
                    SPContent(),
                  ]))),
      Positioned(
        left: 0,
        right: 0,
        bottom: 80,
        child: Suggestion(),
      ),
      Positioned(
        left: 0,
        right: 0,
        bottom: 10,
        child: Container(
            color: Color(0xFFFFFFFF),
            child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: ShenpiTool())) ,
      )
    ]));
  }
}
