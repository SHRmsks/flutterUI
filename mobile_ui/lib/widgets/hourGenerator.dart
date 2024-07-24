import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import './hour.dart';
import 'package:http/http.dart' as http;

class HourGenerate extends StatefulWidget {
  final String date;
  final String userID;
  final String token;
  final DateTime? selected;
  @override
  const HourGenerate(
      {super.key,
      required this.date,
      required this.userID,
      required this.token,
      required this.selected});
  @override
  _HourGenerateState createState() => _HourGenerateState();
}

class _HourGenerateState extends State<HourGenerate> {
  List<Map<String, dynamic>> hourList = [];
  late DateTime pointed;
  @override
  void initState() {
    super.initState();
    log("userID" + widget.userID);
    log("widgetpassed: " + widget.selected!.toIso8601String());
    if (widget.selected != null) {
      setState(() => pointed = widget.selected!);
    } else {
      setState(() => pointed = DateTime.now());
    }
    log("selected $pointed");
    _fetchedHours();
  }

  @override
  void didUpdateWidget(HourGenerate old) {
    super.didUpdateWidget(old);
    if (widget.selected != old.selected) {
      setState(() {
        if (widget.selected != null) {
          setState(() => pointed = widget.selected!);
        } else {
          setState(() => pointed = DateTime.now());
        }
      });
      _fetchedHours();
    }
  }

  void _fetchedHours() async {
    final data = await _getHours(widget.token, widget.userID, widget.date);
    setState(() => hourList = data);
  }

  void removeItem(int index) {
    setState(() {
      Map<String, dynamic> deleted = hourList.removeAt(index);
      // log("Removed item at index $deleted");
    });
    // log("hourlist be like :: $hourList");
  }

  Future<List<Map<String, dynamic>>> _getHours(
      String token, String userID, String dates) async {
    log("selected Date: $pointed");
    final url = Uri.parse(
        "http://223.68.128.86:28218/manage/ServletCtrl?uuid=&token=" + token);
    final header = {"content-type": "text/html;charset=UTF-8"};
    final Map<String, dynamic> data = {
      "name": "com.zfkj.core.Common.queryData",
      "data": {
        "tablename": "xmglxt_gsxx",
        "search_condition": [
          {"field": "creator_id", "value": widget.userID},
          {
            "field": "rq",
            "value": pointed.toIso8601String().replaceAll('T', ' ')
          }
        ],
      }
    };
    final jsonData = jsonEncode(data);
    final response = await http.post(url, headers: header, body: jsonData);
    if (response.statusCode == 200) {
      // log("time" +
      //     DateTime(2024, 7, 15)
      //         .toIso8601String()
      //         .replaceAll('T', ' ')
      //         .substring(0, 10));
      log("hour fetched^^: ${Uri.decodeComponent(response.body)}");

      final decodedData = jsonDecode(Uri.decodeComponent(response.body));

      return (decodedData["data"]["xmglxt_gsxx"] as List)
          .map((item) => item as Map<String, dynamic>)
          .toList();
    } else {
      log("Failed to fetch hours");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return hourList.isEmpty
        ? Center(child: Text("暂无数据"))
        : ListView.builder(
            itemCount: hourList.length,
            itemBuilder: (context, index) {
              final hour = hourList[index];
              log("hour:: $hour");
              final time = hour['gs'].substring(0, 1);
              final task = hour['xmmc'];
              final notes = hour['bz'];

              return Taskhour(
                  time: time,
                  task: task,
                  notes: notes,
                  onDelete: (int idx) => removeItem(idx),
                  index: index);
            });
  }
}
