import 'dart:developer';
import 'package:http/http.dart' as http;
import './widgets/shenpitool.dart';
import "package:flutter/material.dart";
import './widgets/shenpiback.dart';
import "./widgets/shenpitask.dart";
import "dart:convert";
import './widgets/KPContent.dart';

class Shenpikp extends StatefulWidget {
  final String title;
  final String name;
  final String time;
  final String node;
  final String token;
  final String formNum;
  const Shenpikp(
      {super.key,
      required this.title,
      required this.name,
      required this.time,
      required this.node,
      required this.formNum,
      required this.token});
  @override
  _ShenpikpState createState() => _ShenpikpState();
}

class _ShenpikpState extends State<Shenpikp> {
  late Future<Map<String, dynamic>> data;
  @override
  void initState() {
    super.initState();
    data = _getData();
  }

  Future<Map<String, dynamic>> _getData() async {
    final url = Uri.parse(
        "http://223.68.128.86:28218/manage/ServletCtrl?uuid=&token=" +
            widget.token);
    final header = {"content-type": "text/html;charset=UTF-8"};
    Map<String, Object> data = {
      "name": "com.zfkj.core.Common.queryData",
      "data": {
        "tablename": "xmglxt_xmxx",
        "search_condition": [
          {"field": "business_no", "value": widget.formNum}
        ]
      }
    };

    final jsondata = jsonEncode(data);

    final response = await http.post(url, headers: header, body: jsondata);
    if (response.statusCode == 200) {
      log("hello " + Uri.decodeComponent(response.body));
      final responsedata = jsonDecode(Uri.decodeComponent(response.body));
      return responsedata as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: Stack(children: [
      Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          color: Color(0xFFFFFFFF),
          padding: EdgeInsets.only(top: 30),
          child: SPback(backName: "审批"),
        ),
        Expanded(
          child: FutureBuilder<Map<String, dynamic>>(
              future: data,
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.data != null &&
                    snapshot.data!.isNotEmpty) {
                  final data = snapshot.data!;
                  log("snap2?? $data");
                  return KPContent(
                    title: widget.title,
                    applicant: widget.name,
                    applydate: widget.time,
                    node: widget.node,
                  );
                } else {
                  return Center(
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: Center(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                CircularProgressIndicator(),
                                SizedBox(width: 20),
                                Text("加载中请稍后...")
                              ]))));
                }
              }),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 80,
          child: Suggestion(
              // ChangedHeight: _hiddenButton
              ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              color: Color(0xFFFFFFFF),
              child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: ShenpiTool(/*hidden: _hidden*/))),
        )
      ])
    ])));
  }
}
