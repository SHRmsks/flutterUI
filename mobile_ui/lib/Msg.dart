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
  late List<String> title;
  bool _ready = false;
  late List<String> content;
  late List<String> time;
  @override
  void initState() {
    //log("msg Token:" + widget.token);
    super.initState();
    _getData().then((value) {
      if (value.isNotEmpty) {
        if (value.isNotEmpty) {
          setState(() {
            title = value.map((item) => item['title'] as String).toList();
            content = value.map((item) => item['content'] as String).toList();
            time = value.map((item) => item['create_time'] as String).toList();
            _ready = true;
          });
          log('item: $value');
          log('Titles:  $title');
          log('Contents:  $content');
          log('Times:  $time');
        }
      }
    });
  }

  Future<List<Map<String, dynamic>>> _getData() async {
    try {
      final url = Uri.parse(
          "http://223.68.128.86:28218/manage/ServletCtrl?uuid=&token=" +
              widget.token);
      final header = {"content-type": "text/html;charset=UTF-8"};
      Map<String, Object> data = {
        "name": "com.zfkj.core.Common.queryData",
        "data": {
          'page_index': 0,
          'page_size': 10,
          "tablename": "zfkj_inbox",
          "sort_condition": [
            {"field": "id", "direction": "desc"}
          ],
          "search_condition": [
            {"field": "create_time", "value": "2024-05-14", "filter": ">="}
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
        return List<Map<String, dynamic>>.from(
            responsedata['data']['zfkj_inbox']);
        // Handle the data if needed
      } else {
        log('Failed to load data with status: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: Stack(children: [
      Positioned.fill(
        child: Container(
          color: Color(0xFFF9F9F9),
        ),
      ),
      Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          color: Color(0xFFFFFFFF),
          padding: EdgeInsets.only(top: 40, bottom: 10),
          child: SPback(backName: '消息箱'),
        ),
        _ready
            ? Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    itemCount: 1, //hardcoded for now
                    itemBuilder: (context, index) {
                      return MSG(
                        token: widget.token,
                        titles: title,
                        messages: content,
                        times: time,
                        title: '系统消息',
                        msg: title[title.length - 1],
                        time: time[title.length - 1].substring(11, 19),
                        index: index,
                      );
                    }))
            : Expanded(
                child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 20),
                    Text("正在加载中...")
                  ]))),
      ])
    ])));
  }
}
