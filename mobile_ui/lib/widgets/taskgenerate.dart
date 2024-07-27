import 'dart:convert';
import 'dart:developer';

import './daibanWidget.dart';
import 'package:flutter/material.dart';

class TaskGenerate extends StatefulWidget {
  final String workdata;
  final String token;
  final String userid;
  final String username;
  final String dept_id;
  final String dept_name;
  final String uuid;
  @override
  const TaskGenerate(
      {super.key,
      required this.workdata,
      required this.token,
      required this.userid,
      required this.username,
      required this.dept_id,
      required this.uuid,
      required this.dept_name});
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
    log("task length: " + tasks.length.toString());
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
          final workflow_no = task['workflow_no'];
          return Daiban(
              title: title,
              name: name,
              time: time,
              task: taskName,
              token: widget.token,
              formNum: formNum,
              userID: widget.userid,
              username: widget.username,
              dept_id: widget.dept_id,
              dept_name: widget.dept_name,
              uuid: widget.uuid,
              workflow_no: workflow_no);
        });
  }
}
