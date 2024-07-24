import "package:flutter/material.dart";
import "dart:convert";
import "dart:developer";

import "package:flutter/widgets.dart";

class SPContent extends StatefulWidget {
  final String title;
  final String applicant;
  final String applydate;
  final String node;
  final String project;
  final String date;
  final String hours;
  // final String dataList;
  const SPContent(
      {super.key,
      required this.title,
      required this.node,
      required this.applicant,
      required this.applydate,
      required this.project,
      required this.date,
      required this.hours});
  @override
  _SPContentState createState() => _SPContentState();
}

class _SPContentState extends State<SPContent> {
  @override
  Widget build(BuildContext context) {
    log("SPContent build called");
    return (ListView(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Container(
            constraints: BoxConstraints(minHeight: 270),
            child: Stack(children: [
              Image.asset('src/images/SPbg.png'),
              Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "工时审核",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "PingFang SC"),
                                    textAlign: TextAlign.center,
                                  )
                                ])),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 28, bottom: 28),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("流程标题",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF050505),
                                                fontFamily: "PingFang SC",
                                                fontWeight: FontWeight.w600)),
                                        Text(widget.title,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF17181A),
                                                fontFamily: "PingFang SC",
                                                fontWeight: FontWeight.w400))
                                      ],
                                    ),
                                    Divider(
                                      color: Color(0xFFF0F0F2),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("提交人",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF050505),
                                                fontFamily: "PingFang SC",
                                                fontWeight: FontWeight.w600)),
                                        Text(widget.applicant,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF17181A),
                                                fontFamily: "PingFang SC",
                                                fontWeight: FontWeight.w400))
                                      ],
                                    ),
                                    Divider(
                                      color: Color(0xFFF0F0F2),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("申请日期",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF050505),
                                                fontFamily: "PingFang SC",
                                                fontWeight: FontWeight.w600)),
                                        Text(widget.applydate,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF17181A),
                                                fontFamily: "PingFang SC",
                                                fontWeight: FontWeight.w400))
                                      ],
                                    ),
                                    Divider(color: Color(0xFFF0F0F2)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("流程节点",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF050505),
                                                fontFamily: "PingFang SC",
                                                fontWeight: FontWeight.w600)),
                                        Text(widget.node,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF17181A),
                                                fontFamily: "PingFang SC",
                                                fontWeight: FontWeight.w400))
                                      ],
                                    ),
                                  ])),
                        )
                      ])),
            ])),
        Container(
            color: Color(0xFFFFFFFF),
            child: Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('src/images/gongshixinxi.png'),
                        SizedBox(width: 8),
                        Text("工时信息",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF050505),
                                fontFamily: "PingFang SC",
                                fontWeight: FontWeight.w700))
                      ],
                    ),
                    Divider(color: Color(0xFFF0F0F2)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("所属项目",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF050505),
                                fontFamily: "PingFang SC",
                                fontWeight: FontWeight.w600)),
                        ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 20)),
                        Text(widget.project,
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF17181A),
                                fontFamily: "PingFang SC",
                                fontWeight: FontWeight.w400),
                            overflow: TextOverflow.fade),
                      ],
                    ),
                    Divider(color: Color(0xFFF0F0F2)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("日期",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF050505),
                                fontFamily: "PingFang SC",
                                fontWeight: FontWeight.w600)),
                        ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 20)),
                        Text(widget.date,
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF17181A),
                                fontFamily: "PingFang SC",
                                fontWeight: FontWeight.w400),
                            overflow: TextOverflow.fade),
                      ],
                    ),
                    Divider(color: Color(0xFFF0F0F2)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("工时(h)",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF050505),
                                fontFamily: "PingFang SC",
                                fontWeight: FontWeight.w600)),
                        ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 20)),
                        Text(widget.hours,
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF17181A),
                                fontFamily: "2.0",
                                fontWeight: FontWeight.w400),
                            overflow: TextOverflow.fade),
                      ],
                    ),
                    Divider(color: Color(0xFFF0F0F2)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("备注",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF050505),
                                fontFamily: "PingFang SC",
                                fontWeight: FontWeight.w600)),
                        ConstrainedBox(
                            constraints: BoxConstraints(minWidth: 20)),
                        Expanded(
                          child: Text(
                            "这是一行备注信息这是一行备注信息这是一行备注信息这是一行备注信息",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF17181A),
                                fontFamily: "2.0",
                                fontWeight: FontWeight.w400),
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    )
                  ],
                )))
      ],
    ));
  }
}
