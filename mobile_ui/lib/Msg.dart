import 'package:flutter/material.dart';
import './widgets/shenpiback.dart';
import 'dart:developer';
import 'dart:convert';
import './widgets/msgwidget.dart';
import 'package:http/http.dart' as http;

class Message extends StatefulWidget {
  final String userID;
  final String token;
  Message({super.key, required this.userID, required this.token});
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  void initState() {
    //log("msg Token:" + widget.token);
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    try {
      final url = Uri.parse(
          "http://223.68.128.86:28218/manage/ServletCtrl?uuid=&token=" +
              widget.token);
      final header = {"content-type": "text/html;charset=UTF-8"};
      Map<String, Object> data = {
        "name": "com.zfkj.core.Common.queryData",
        "data": {
          "tablename": "zfkj_inbox",
          "search_condition": [
            {"field": "create_time", "value": "2024-06-14", "filter": ">="}
          ]
        }
      };
      final jsondata = jsonEncode(data);
      log("Sending request to: $url");
      log("Request body: $jsondata");
      final response = await http.post(url, headers: header, body: jsondata);
      log("Response status: ${response.statusCode}");
      log("Response headers: ${response.headers}");
      if (response.statusCode == 200) {
        log("msgDaTa: " + Uri.decodeComponent(response.body));
        final responsedata = jsonDecode(Uri.decodeComponent(response.body));
        log("Decoded response data: $responsedata");
        // Handle the data if needed
      } else {
        log('Failed to load data with status: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      log('Exception caught: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        color: Color(0xFFFFFFFF),
        padding: EdgeInsets.only(top: 30, bottom: 10),
        child: SPback(backName: '消息箱'),
      ),
      Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              itemCount: 2,
              itemBuilder: (context, index) {
                return MSG(
                  title: '系统消息',
                  msg: '产品创造于工厂，而品牌创造于心灵ff3f3f3fih34ihf3hf3h4f3fh348fh3f34fh39',
                  time: '下午08:13',
                  index: index,
                );
              })),
    ])));
  }
}
