import 'dart:convert';

import './daibanWidget.dart';
import 'package:flutter/material.dart';

class TaskGenerate extends StatefulWidget {
  final String workdata;
  @override
  const TaskGenerate({super.key, required String this.workdata});
  @override
  _TaskGenerateState createState() => _TaskGenerateState();
}

class _TaskGenerateState extends State<TaskGenerate> {
  late String name;
  late String title;
  late String time;
  late String task;
  late List<Map<String, dynamic>> tasks;

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> workdataDecoded = jsonDecode(widget.workdata);
    tasks = List<Map<String, dynamic>>.from(
        workdataDecoded['data']['ds_query_todolist']);
    name = tasks[0]['creator'];
    title = tasks[0]['node_name'];
    time = tasks[0]['create_time'];
    task = tasks[0]['workflow_name'];
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [Daiban(title: title, name: name, time: time, task: task)],
    );
  }
}
