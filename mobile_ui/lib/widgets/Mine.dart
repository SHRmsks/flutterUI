import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class Mine extends StatefulWidget {
  final String user_id;
  final String token;
  final String name;
  const Mine(
      {super.key,
      required this.user_id,
      required this.token,
      required this.name});
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(widget.name,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xFF050505),
                                  fontWeight: FontWeight.w600,
                                )),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 7)),
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
                                      BorderRadius.all(Radius.circular(20))),
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
                )),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {

            Navigator.pushNamed(context, '/message', arguments: {
                        "userID": widget.user_id,
                        "token": widget.token
                      });



                    },
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset('src/images/messageBox.png'),
                                ConstrainedBox(
                                    constraints: BoxConstraints(minWidth: 8)),
                                Text(
                                  "消息箱",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "PingFang SC",
                                  ),
                                )
                              ],
                            ),
                            Image.asset('src/images/next.png'),
                          ],
                        )),
                  ),
                  Divider(color: Color(0xFFF0F0F2), thickness: 0.5),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/reset', arguments: {
                          "userID": widget.user_id,
                          "token": widget.token
                        });
                      },
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset('src/images/resetPswrd.png'),
                                  ConstrainedBox(
                                      constraints: BoxConstraints(minWidth: 8)),
                                  Text(
                                    "修改密码",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF050505),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "PingFang SC",
                                    ),
                                  )
                                ],
                              ),
                              Image.asset('src/images/next.png'),
                            ],
                          ))),
                ],
              ),
            )
          ]),
    ));
  }
}
