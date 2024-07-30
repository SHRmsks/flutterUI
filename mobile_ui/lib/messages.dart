import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import './widgets/shenpiback.dart';
import './widgets/messagewdgt.dart';

class Messages extends StatefulWidget {
  final List<String> contents;
  final List<String> times;
  final token;
  Messages(
      {Key? key,
      required this.contents,
      required this.times,
      required this.token})
      : super(key: key);
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  final ScrollController _scrollController = ScrollController();
  bool _loadingEarlier = false;
  List<String> contents = [];
  List<String> times = [];
  int index = 1;
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      contents = widget.contents;
      times = widget.times;
      //log("before:$contents");
      //log("before:$times");
    });
    _scrollController.addListener(() {
      // log("positionpixels:  ${_scrollController.position.pixels}");
      // log("minscrollextent: ${_scrollController.position.minScrollExtent}");
      // log("$_loadingEarlier");
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !_loadingEarlier) {
        // log("fetched?? ");
        // log("after:$contents");
        // log("after:$times");
        _fetchedEarlier();
      }
    });
  }

  Future<void> _fetchedEarlier() async {
    setState(() => _loadingEarlier = true);
    try {
      List<Map<String, dynamic>> older = await _getData();

      setState(() {
        final oldermessage = older.map((item) {
          // log("item::: $item");
          // log("item::: $item['content']");

          return item['content'] as String;
        }).toList();

        contents.addAll(oldermessage);

        // log("index:: $index");
        // log("this contents: $contents");
        final olderTime =
            older.map((item) => item['start_time'] as String).toList();

        times.addAll(olderTime);
        index++;
        _loadingEarlier = false;
      });
    } catch (e) {
      // log('Error fetching older messagesdede: $e');
      setState(() => _loadingEarlier = false);
    }
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
          'page_index': index,
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
      final response = await http.post(url, headers: header, body: jsondata);
      //log("Response status???: ${response.statusCode}");
      // log("Response headers???: ${response.headers}");
      if (response.statusCode == 200) {
        // log("msgDaTa????? " + Uri.decodeComponent(response.body));
        // log("indexXXXXX $index");
        final responsedata = jsonDecode(Uri.decodeComponent(response.body));
        return List<Map<String, dynamic>>.from(
            responsedata['data']['zfkj_inbox']);
      } else {
        // log('Failed to load data with status: ${response.statusCode}');
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
          child: SPback(backName: '系统消息'),
        ),
        Expanded(
            child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(left: 15, right: 65),
                itemCount: contents.length,
                itemBuilder: (context, index) {
                  if (index >= contents.length) return SizedBox.shrink();
                  // log("inDEX $index");
                  // log("contents&(* : $contents)");
                  // log("times&(* : $times)");
                  return MessageWidget(
                      content: contents[index], time: times[index]);
                })),
      ])
    ])));
  }
}
