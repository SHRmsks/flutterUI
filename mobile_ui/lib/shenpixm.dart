import 'dart:developer';
import 'package:http/http.dart' as http;
import './widgets/shenpitool.dart';
import "package:flutter/material.dart";
import './widgets/shenpiback.dart';

import "./widgets/shenpitask.dart";
import "dart:convert";
import './widgets/LXcontent.dart';

class Shenpixm extends StatefulWidget {
  final String title;
  final String name;
  final String time;
  final String node;
  final String token;
  final String formNum;
  final String userID;
  final String username;
  final String dept_id;
  final String dept_name;
  final String uuid;
  const Shenpixm({
    super.key,
    required this.title,
    required this.name,
    required this.time,
    required this.node,
    required this.formNum,
    required this.token,
    required this.userID,
    required this.username,
    required this.dept_id,
    required this.dept_name,
    required this.uuid,
  });
  @override
  _ShenpixmState createState() => _ShenpixmState();
}

class _ShenpixmState extends State<Shenpixm> {
  late Future<Map<String, dynamic>> data;
  late Future<Map<String, dynamic>> data2;
  @override
  void initState() {
    super.initState();

    data = _getData();
    data2 = _getData2();
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

  Future<Map<String, dynamic>> _getData2() async {
    final url2 = Uri.parse(
        "http://223.68.128.86:28218/manage/ServletCtrl?uuid=&token=" +
            widget.token);
    final header2 = {"content-type": "text/html;charset=UTF-8"};
    Map<String, dynamic> data2 = {
      "name": "com.zfkj.core.Common.queryData",
      "data": {
        "tablename": "xmglxt_xmxx_ryxx",
        "search_condition": [
          {"field": "business_no", "value": widget.formNum}
        ]
      }
    };
    final jsondata2 = jsonEncode(data2);
    final response = await http.post(url2, headers: header2, body: jsondata2);
    if (response.statusCode == 200) {
      log("hello22 " + Uri.decodeComponent(response.body));
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
          child: FutureBuilder<List<Map<String, dynamic>>>(
              future: Future.wait([data, data2]),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.data != null &&
                    snapshot.data!.isNotEmpty) {
                  final data = snapshot.data!;
                  log("snap2?? $data");

                  return LXContent(
                    title: widget.title,
                    applicant: widget.name,
                    applydate: widget.time,
                    node: widget.node,
                    project_id:
                        (data[0]['data']['xmglxt_xmxx'][0]['xmbh'].isEmpty)
                            ? '-'
                            : data[0]['data']['xmglxt_xmxx'][0]['xmbh'],
                    project_name:
                        (data[0]['data']['xmglxt_xmxx'][0]['xmmc'].isEmpty)
                            ? '-'
                            : data[0]['data']['xmglxt_xmxx'][0]['xmmc'],
                    client: (data[0]['data']['xmglxt_xmxx'][0]['khbh'].isEmpty)
                        ? '-'
                        : data[0]['data']['xmglxt_xmxx'][0]['khbh'],
                    product_name:
                        (data[0]['data']['xmglxt_xmxx'][0]['cpbh'].isEmpty)
                            ? '-'
                            : data[0]['data']['xmglxt_xmxx'][0]['cpbh'],
                    time: (data[0]['data']['xmglxt_xmxx'][0]['rq'].isEmpty)
                        ? '-'
                        : data[0]['data']['xmglxt_xmxx'][0]['rq']
                            .substring(0, 10),
                    manager:
                        (data[0]['data']['xmglxt_xmxx'][0]['xmjlmc'].isEmpty)
                            ? '-'
                            : data[0]['data']['xmglxt_xmxx'][0]['xmjlmc'],
                    amount: (data[0]['data']['xmglxt_xmxx'][0]['htje'].isEmpty)
                        ? '-'
                        : data[0]['data']['xmglxt_xmxx'][0]['htje'],
                    endDate: (data[0]['data']['xmglxt_xmxx'][0]['jsrq'].isEmpty)
                        ? '--'
                        : data[0]['data']['xmglxt_xmxx'][0]['jsrq'],
                    team: '--',
                    totaltime:
                        (data[0]['data']['xmglxt_xmxx'][0]['xmzgs'].isEmpty)
                            ? '--'
                            : data[0]['data']['xmglxt_xmxx'][0]['xmzgs'],
                    productrevenue:
                        (data[0]['data']['xmglxt_xmxx'][0]['cpsr'].isEmpty)
                            ? '--'
                            : data[0]['data']['xmglxt_xmxx'][0]['cpsr'],
                    servicerevenue:
                        (data[0]['data']['xmglxt_xmxx'][0]['fwsr'].isEmpty)
                            ? '--'
                            : data[0]['data']['xmglxt_xmxx'][0]['fwsr'],
                    hrexpense:
                        (data[0]['data']['xmglxt_xmxx'][0]['ryf'].isEmpty)
                            ? '--'
                            : data[0]['data']['xmglxt_xmxx'][0]['ryf'],
                    expense: (data[0]['data']['xmglxt_xmxx'][0]['cgf'].isEmpty)
                        ? '--'
                        : data[0]['data']['xmglxt_xmxx'][0]['cgf'],
                    tripexpense:
                        (data[0]['data']['xmglxt_xmxx'][0]['clf'].isEmpty)
                            ? '--'
                            : data[0]['data']['xmglxt_xmxx'][0]['clf'],
                    otherexpense:
                        (data[0]['data']['xmglxt_xmxx'][0]['qtfy'].isEmpty)
                            ? '--'
                            : data[0]['data']['xmglxt_xmxx'][0]['qtfy'],
                    warranty:
                        (data[0]['data']['xmglxt_xmxx'][0]['wbje'].isEmpty)
                            ? '--'
                            : data[0]['data']['xmglxt_xmxx'][0]['wbje'],
                    warrantycycle:
                        (data[0]['data']['xmglxt_xmxx'][0]['wbzq'].isEmpty)
                            ? '--'
                            : data[0]['data']['xmglxt_xmxx'][0]['wbzq'],
                    filename:
                        (data[0]['data']['xmglxt_xmxx'][0]['fj_name'].isEmpty)
                            ? []
                            : data[0]['data']['xmglxt_xmxx'][0]['fj_name'].split(','),
                    file: (data[0]['data']['xmglxt_xmxx'][0]['fj'].isEmpty)
                        ? []
                        : data[0]['data']['xmglxt_xmxx'][0]['fj'].split(','),
                    token: widget.token,
                    userID: widget.userID,
                    username: widget.username,
                    dept_id: widget.dept_id,
                    uuid: widget.uuid,
                    dept_name: widget.dept_name,
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
