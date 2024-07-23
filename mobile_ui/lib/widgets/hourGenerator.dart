import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import './hour.dart';
import 'package:http/http.dart' as http;

class HourGenerate extends StatefulWidget {
  final String date;
  final String userID;
  final String token;

  @override
  const HourGenerate(
      {super.key,
      required this.date,
      required this.userID,
      required this.token});
  @override
  _HourGenerateState createState() => _HourGenerateState();
}

class _HourGenerateState extends State<HourGenerate> {
  late Future<String> hours;
  @override
  void initState() {
    super.initState();
    log("userID" + widget.userID);
    hours = _getHours(widget.token, widget.userID, widget.date);
  }

  List items = [1, 2, 3, 4, 5];

  Future<String> _getHours(String token, String userID, String dates) async {
    final url = Uri.parse(
        "http://223.68.128.86:28218/manage/ServletCtrl?uuid=&token=" + token);
    final header = {"content-type": "text/html;charset=UTF-8"};
    final Map<String, dynamic> data = {
      "name": "com.zfkj.core.Common.queryData",
      "data": {
        "tablename": "xmglxt_gsxx",
        "search_condition": [
          {
            "field": "creator_id",
            "value": [widget.userID]
          },
          {
            "field": "rq",
            "value": [DateTime(2024, 7, 15).toIso8601String()]
          }
        ],
      }
    };
    final jsonData = jsonEncode(data);
    final response = await http.post(url, headers: header, body: jsonData);
    if (response.statusCode == 200) {
      log("hour fetched^^: ${Uri.decodeComponent(response.body)}");
      return Uri.decodeComponent(response.body);
    } else {
      log("Failed to fetch hours");
      return "";
    }
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: hours,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 20),
                  Text("正在加载中...")
                ]));
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("暂无数据"));
          } else {
            return (ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Taskhour(
                      time: widget.date,
                      task: "sds",
                      notes: null,
                      onDelete: removeItem,
                      index: index);
                }));
          }
        });
  }
}
