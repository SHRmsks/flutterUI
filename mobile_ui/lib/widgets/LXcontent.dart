import "package:flutter/material.dart";
import "dart:convert";
import "dart:developer";

class LXContent extends StatefulWidget {
  final String title;
  final String applicant;
  final String applydate;
  final String node;
  final String project_id;
  final String project_name;
  final String client;
  final String product_name;
  final String time;
  final String manager;
  final String amount;
  final String endDate;
  final String team;
  const LXContent({
    super.key,
    required this.title,
    required this.applicant,
    required this.applydate,
    required this.node,
    required this.project_id,
    required this.project_name,
    required this.client,
    required this.product_name,
    required this.time,
    required this.manager,
    required this.amount,
    required this.endDate,
    required this.team,
  });
  @override

  // TODO: implement createElement
  _LXContentState createState() => _LXContentState();
}

class _LXContentState extends State<LXContent> {
  Widget build(BuildContext context) {
    log("LXContent build called");
    return (ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
              constraints: BoxConstraints(minHeight: 270),
              child: Stack(children: [
                Image.asset('src/images/SPbg.png'),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "立项审核",
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
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 28),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Text(widget.title,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xFF17181A),
                                                    fontFamily: "PingFang SC",
                                                    fontWeight:
                                                        FontWeight.w400))
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
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Text(widget.applicant,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFF17181A),
                                                      fontFamily: "PingFang SC",
                                                      fontWeight:
                                                          FontWeight.w400))
                                            ]),
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
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Text(widget.applydate,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xFF17181A),
                                                    fontFamily: "PingFang SC",
                                                    fontWeight:
                                                        FontWeight.w400))
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
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Text(widget.node,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xFF17181A),
                                                    fontFamily: "PingFang SC",
                                                    fontWeight:
                                                        FontWeight.w400))
                                          ],
                                        ),
                                      ])))
                        ]))
              ])),
          Container(
              color: Color(0xFFFFFFFF),
              child: Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 13, bottom: 13),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('src/images/projInfo.png'),
                              SizedBox(width: 8),
                              Text("项目信息",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF050505),
                                      fontFamily: "PingFang SC",
                                      fontWeight: FontWeight.w700))
                            ]),
                        Divider(color: Color(0xFFF0F0F2)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("项目编号",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF050505),
                                      fontFamily: "PingFang SC",
                                      fontWeight: FontWeight.w600)),
                              ConstrainedBox(
                                  constraints: BoxConstraints(minWidth: 20)),
                              Text(widget.project_id,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF17181A),
                                      fontFamily: "PingFang SC",
                                      fontWeight: FontWeight.w400),
                                  overflow: TextOverflow.fade),
                            ]),
                        Divider(color: Color(0xFFF0F0F2)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("项目名称",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.project_name,
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
                            Text("客户名称",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.client,
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
                            Text("产品名称",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.product_name,
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
                            Text("立项日期",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.time,
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
                            Text("合同金额",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.amount,
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
                            Text("预计结束日期",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.endDate,
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
                            Text("所属团队",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.team,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF17181A),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w400),
                                overflow: TextOverflow.fade),
                          ],
                        ),
                      ]))),
          Container(
              color: Color(0xFFFFFFFF),
              child: Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 13, bottom: 13),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('src/images/attachment.png'),
                              SizedBox(width: 8),
                              Text('附件',
                                  style: TextStyle(
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                  ))
                            ]),
                        Divider(color: Color(0xFFF0F0F2)),
                        Container(
                          height: 100,
                          color: Color(0xFFFFFFFF),
                        ),
                      ]))),
          Container(
              color: Color(0xFFFFFFFF),
              child: Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 13, bottom: 13),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('src/images/budget.png'),
                              SizedBox(
                                width: 8,
                              ),
                              Text('预算信息',
                                  style: TextStyle(
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                  )),
                            ]),
                        Divider(color: Color(0xFFF0F0F2)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("项目总工时",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.team,
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
                            Text("产品收入",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.team,
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
                            Text("服务收入",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.team,
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
                            Text("人员费用支出",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.team,
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
                            Text("采购费用支出",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.team,
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
                            Text("差旅费用支出",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.team,
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
                            Text("其他费用支出",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.team,
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
                            Text("维保金融",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.team,
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
                            Text("维保周期(年)",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.team,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF17181A),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w400),
                                overflow: TextOverflow.fade),
                          ],
                        ),
                      ]))),
          Container(
              color: Color(0xFFFFFFFF),
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 13, bottom: 13),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('src/images/ppl.png'),
                            SizedBox(width: 8),
                            Text("工时信息",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w700))
                          ]),
                      Divider(color: Color(0xFFF0F0F2)),
                      Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFE1E2E5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text('序号',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Color(0xFF2D2D2D),
                                              fontFamily: "PingFang SC",
                                              fontWeight: FontWeight.w600)),
                                      Text('人员编号',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Color(0xFF2D2D2D),
                                              fontFamily: "PingFang SC",
                                              fontWeight: FontWeight.w600)),
                                      Text('人员名称',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Color(0xFF2D2D2D),
                                              fontFamily: "PingFang SC",
                                              fontWeight: FontWeight.w600)),
                                    ]),
                                Divider(color: Color(0xFFF0F0F2)),
                              ]))
                    ]),
              ))
        ]));
  }
}
