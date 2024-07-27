import "package:flutter/material.dart";
import "dart:convert";
import 'package:http/http.dart' as http;

import "dart:developer";
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../PDF.dart';
import 'dart:async';

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
  final String totaltime;
  final String productrevenue;
  final String servicerevenue;
  final String hrexpense;
  final String expense;
  final String tripexpense;
  final String otherexpense;
  final String warranty;
  final String warrantycycle;
  final List<String> file;
  final List<String> filename;
  final String token;
  final String userID;
  final String username;
  final String dept_id;
  final String dept_name;
  final String uuid;
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
    required this.totaltime,
    required this.productrevenue,
    required this.servicerevenue,
    required this.hrexpense,
    required this.expense,
    required this.tripexpense,
    required this.otherexpense,
    required this.warranty,
    required this.warrantycycle,
    required this.file,
    required this.filename,
    required this.token,
    required this.userID,
    required this.username,
    required this.dept_id,
    required this.dept_name,
    required this.uuid,
  });
  @override

  // TODO: implement createElement
  _LXContentState createState() => _LXContentState();
}

class _LXContentState extends State<LXContent> {
  String PDF_file = "";
  bool isDownloading = false;
  int idx = -1;
  @override
  void initState() {
    super.initState();
    log('PDF file: ' + widget.file.toString());
    log('PDF filename: ' + widget.filename.toString());
    log('userID: ' + widget.userID);

    log('PDF__file:: $PDF_file');
  }

  Future<File> getPDF(int index) async {
    Completer<File> completer = Completer();

    try {
      Map<String, dynamic> data = {
        "user_id": widget.userID,
        "user_name": widget.username,
        "dept_id": widget.dept_id,
        "dept_name": widget.dept_name,
        "name": widget.filename[index],
        "filename": widget.file[index].replaceAll("\\", "/"),
        "is_full_path": false
      };
      final uridata = Uri.encodeComponent(jsonEncode(data));
      log("jsondata $uridata");
      final Url = Uri.parse(
          'http://223.68.128.86:28218/manage/DownloadFileCtrl?request_data=' +
              uridata +
              '&uuid=' +
              widget.uuid +
              '&token=' +
              widget.token);
      log("myurl " +
          'http://223.68.128.86:28218/manage/DownloadFileCtrl?request_data=' +
          uridata +
          '&uuid=' +
          widget.uuid +
          '&token=' +
          widget.token);
      final response = await http.get(Url);
      log("status ${response.statusCode}");
      if (response.statusCode == 200) {
        final directory = await getApplicationDocumentsDirectory();
        final filepath = '${directory.path}/${widget.filename}';
        final file = File(filepath);
        await file.writeAsBytes(response.bodyBytes);
        bool fileExists = await file.exists();

        log("PDF saved to: $filepath, file exists: $fileExists");
        if (fileExists) {
          completer.complete(file);
        } else {
          log("didn't write to dissk");
        }
      } else {
        log('failed to download PDF file');
        completer.completeError('Failed to download PDF file');
      }
    } catch (e) {
      throw Exception("读取失败, $e");
    }
    return completer.future;
  }

  Widget pdfGenerator(BuildContext context, int index) {
    return (GestureDetector(
        onTap: () async {
          setState(() {isDownloading = true;   idx = index;
          });
          await getPDF(index).then((value) => setState(() {
                PDF_file = value.path;
                isDownloading = false;
                idx = -1;
              }));

          log('PDF_File:: $PDF_file ');
          if (PDF_file.isNotEmpty) {
            log('callling PDF SCreen');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PDFScreen(
                        path: PDF_file, filename: widget.filename[index])));
          }
        },
        child: Wrap(children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            (isDownloading && idx == index)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            maxHeight: 10, maxWidth: 10), // Adjusted size
                        child: CircularProgressIndicator(
                          color: Color(
                            0xFF0064FF,
                          ),
                          strokeWidth: 1,
                        ),
                      ),
                      SizedBox(
                          width: 7), // Space between the spinner and the text
                      Text("下载中...",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xFF0064FF),
                              fontFamily: "PingFang SC")),
                    ],
                  )
                : Text(widget.filename[index],
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF0064FF),
                        fontFamily: "PingFang SC")),
          ])
        ])));
  }

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
                            Text("项目经理",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF050505),
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600)),
                            ConstrainedBox(
                                constraints: BoxConstraints(minWidth: 20)),
                            Text(widget.manager,
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
                            constraints: BoxConstraints(minHeight: 80),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            color: Color(0xFFFFFFFF),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  List.generate(widget.file.length, (index) {
                                return Row(children: [
                                  pdfGenerator(context, index),
                                  SizedBox(width: 15)
                                ]);
                              }),
                            )),
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
                            Text(widget.totaltime,
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
                            Text(widget.productrevenue,
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
                            Text(widget.servicerevenue,
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
                            Text(widget.hrexpense,
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
                            Text(widget.expense,
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
                            Text(widget.tripexpense,
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
                            Text(widget.otherexpense,
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
                            Text(widget.warranty,
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
                            Text(widget.warrantycycle,
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
                            Text("项目人员",
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
