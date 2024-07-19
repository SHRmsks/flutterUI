import 'dart:developer';
import 'package:http/http.dart' as http;
import './widgets/shenpitool.dart';
import "package:flutter/material.dart";
import './widgets/shenpiback.dart';
import './widgets/shenpicontent.dart';
import "./widgets/shenpitask.dart";
import "dart:convert";

class Shenpi extends StatefulWidget {
  final String title;
  final String name;
  final String time;
  final String node;
  final String token;
  final String formNum;
  const Shenpi(
      {super.key,
      required this.title,
      required this.name,
      required this.time,
      required this.node,
      required this.formNum,
      required this.token});
  @override
  _ShenpiState createState() => _ShenpiState();
}

class _ShenpiState extends State<Shenpi> {
  late Future<Map<String, dynamic>> data;
  // late String project;
  // late String date;
  // late String hours;

  // bool _hidden = false;
  // void _hiddenButton(double height) {
  //   // log('Height received: $height');
  //   if (height < 31) {
  //     setState(() {
  //       _hidden = true;
  //     });
  //   } else {
  //     setState(() {
  //       _hidden = false;
  //     });
  //   }
  // }
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
        "tablename": "xmglxt_gsxx",
        "search_condition": [
          {"field": "workflow_no", "value": widget.formNum}
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
                    SPback(backName: "审批"),
                    FutureBuilder<Map<String, dynamic>>(
                        future: data,
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              snapshot.data != null &&
                              snapshot.data!.isNotEmpty) {
                            final data = snapshot.data!;
                            log("snap2" + '$data');

                            return SPContent(
                              title: widget.title,
                              applicant: widget.name,
                              applydate: widget.time,
                              node: widget.node,
                              project: data["data"]["xmglxt_gsxx"][0]["xmmc"],
                              date: data["data"]["xmglxt_gsxx"][0]["rq"]
                                  .substring(0, 10),
                              hours: data["data"]["xmglxt_gsxx"][0]["gs"]
                                  .toString(),
                            );
                          } else {
                            return Center(
                                child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    child: Center(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                          CircularProgressIndicator(),
                                          SizedBox(width: 20),
                                          Text("加载中请稍后...")
                                        ]))));
                          }
                        })
                  ]))),
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
            color: Color(0xFFFFFFFF),
            child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: ShenpiTool(/*hidden: _hidden*/))),
      )
    ]));
  }
}
