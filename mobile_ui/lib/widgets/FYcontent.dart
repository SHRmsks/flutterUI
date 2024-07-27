import "package:flutter/material.dart";
import "dart:convert";
import "dart:developer";

class FYContent extends StatefulWidget {
  final String title;
  final String applicant;
  final String applydate;
  final String node;
  final String project_id;
  final String project_name;
  final String client;
  final String notes;
  final String accompany;
  final String destination;
  final String start_date;
  final String end_date;
  final String receipt_no;
  final String amount;
  final String loan;
  final String loan_offset;
  final String offset_amount;
  final String company_name;

  FYContent(
      {super.key,
      required this.title,
      required this.applicant,
      required this.node,
      required this.project_id,
      required this.project_name,
      required this.client,
      required this.notes,
      required this.accompany,
      required this.destination,
      required this.start_date,
      required this.end_date,
      required this.applydate,
      required this.receipt_no,
      required this.amount,
      required this.loan,
      required this.loan_offset,
      required this.offset_amount,
      required this.company_name});

  @override
  _FYContentState createState() => _FYContentState();
}

class _FYContentState extends State<FYContent> {
  @override
  Widget build(BuildContext context) {
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
                                      "费用报销审核",
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
                                      ]))),
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
                              Image.asset('src/images/basic.png'),
                              SizedBox(width: 8),
                              Text("基本信息",
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
                            Text("所属项目",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.project_name,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF17181A),
                                        fontFamily: "PingFang SC",
                                        fontWeight: FontWeight.w400),
                                    softWrap: true,
                                  )
                                ]),
                          ],
                        ),
                        Divider(color: Color(0xFFF0F0F2)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("报销人",
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
                            Text("备注",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.notes,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF17181A),
                                          fontFamily: "PingFang SC",
                                          fontWeight: FontWeight.w400),
                                      softWrap: true),
                                ])
                          ],
                        ),
                        Divider(color: Color(0xFFF0F0F2)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("同行人员",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.accompany,
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
                            Text("目的地",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.destination,
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
                            Text("开始日期",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.start_date,
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
                            Text("结束日期",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.end_date,
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
                            Text("单据张数",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.receipt_no,
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
                            Text("合计金额",
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
                            Text("未结清借款",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.loan,
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
                            Text("是否还借款",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.loan_offset,
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
                            Text("还款金额",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.offset_amount,
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
                            Text("付款公司",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.amount,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF17181A),
                                        fontFamily: "PingFang SC",
                                        fontWeight: FontWeight.w400),
                                    softWrap: true,
                                  )
                                ]),
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
                              Image.asset('src/images/details.png'),
                              SizedBox(width: 8),
                              Text("明细",
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('报销明细',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xFF2D2D2D),
                                            fontFamily: "PingFang SC",
                                            fontWeight: FontWeight.w600)),
                                    Text('金额',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xFF2D2D2D),
                                            fontFamily: "PingFang SC",
                                            fontWeight: FontWeight.w600)),
                                    Text('发票号码',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xFF2D2D2D),
                                            fontFamily: "PingFang SC",
                                            fontWeight: FontWeight.w600)),
                                    Text('发票名称',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xFF2D2D2D),
                                            fontFamily: "PingFang SC",
                                            fontWeight: FontWeight.w600)),
                                  ],
                                )
                              ],
                            ))
                      ])))
        ]));
  }
}
