import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class Mine extends StatefulWidget {
  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return (Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("src/images/userimage.png"),
                    ConstrainedBox(constraints: BoxConstraints(minWidth: 13)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("张三",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xFF050505),
                                  fontWeight: FontWeight.w600,
                                )),
                            Container(
                              decoration: BoxDecoration(
                                  gradient: (LinearGradient(
                                      colors: [
                                        Color(0xFF0064FF),
                                        Color(0xFF09C6F8)
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(1))),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              child: Center(
                                  child: Text("研发部",
                                      style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "PingFang SC",
                                      ))),
                            )
                          ],
                        ),
                        Text(
                          "8888000473",
                          style: TextStyle(
                              color: Color(0xFF5F6066),
                              fontFamily: "PingFang SC",
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.start,
                        )
                      ],
                    )
                  ],
                ))
          ]),
    ));
  }
}
