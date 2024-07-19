import 'dart:convert';
import 'package:flutter/material.dart';
import './hour.dart';

class HourGenerate extends StatefulWidget {
  final String date;
  @override
  const HourGenerate({super.key, required this.date});
  @override
  _HourGenerateState createState() => _HourGenerateState();
}

class _HourGenerateState extends State<HourGenerate> {
  @override
  Widget build(BuildContext context) {
    return (ListView(
      children: [
        Taskhour(time: widget.date, task: "dwe", notes: null, status: 0),
      ],
    ));
  }
}
