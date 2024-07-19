import 'dart:convert';

import './daibanWidget.dart';
import 'package:flutter/material.dart';

class TaskGenerate extends StatefulWidget {
  final String workdata;
  final String token;
  @override
  const TaskGenerate({super.key, required this.workdata, required this.token});
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
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          final name = task['creator'];
          final title = task['node_name'];
          final time = task['create_time'];
          final taskName = task['workflow_name'];
          final formNum = task['form_no'];
          return Daiban(
              title: title,
              name: name,
              time: time,
              task: taskName,
              token: widget.token,
              formNum: formNum);
        });
  }
}
