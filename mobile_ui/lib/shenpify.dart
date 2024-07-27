import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import './widgets/shenpiback.dart';
import './widgets/FYcontent.dart';
import './widgets/shenpitool.dart';
import './widgets/shenpitask.dart';

class Shenpify extends StatefulWidget {
  final String title;
  final String name;
  final String time;
  final String node;
  final String token;
  final String formNum;
  Shenpify(
      {Key? key,
      required this.title,
      required this.name,
      required this.time,
      required this.node,
      required this.token,
      required this.formNum})
      : super(key: key);
  @override
  _ShenpifyState createState() => _ShenpifyState();
}

class _ShenpifyState extends State<Shenpify> {
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
                    return FYContent(
                      title: widget.title,
                      applicant: widget.name,
                      applydate: widget.time,
                      node: widget.node,
                      project_id: '1',
                      project_name: '1',
                      client: '1',
                      notes: '1',
                      accompany: '1',
                      destination: '1',
                      start_date: '1',
                      end_date: '1',
                      receipt_no: '1',
                      amount: '1',
                      loan: '1',
                      loan_offset: '1',
                      offset_amount: '1',
                      company_name: '1',
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
                })),
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
