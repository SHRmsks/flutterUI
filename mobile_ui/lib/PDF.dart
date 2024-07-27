import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:async';

class PDFScreen extends StatefulWidget {
  final String path;
  final String filename;
  PDFScreen({super.key, required this.path, required this.filename});
  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? _pages = 0;
  int? _current = 0;
  bool isReady = false;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
            title: Text(
          widget.filename,
          style: TextStyle(
              fontSize: 16,
              color: Color(0xFF17181A),
              fontFamily: "PingFang SC",
              fontWeight: FontWeight.w600),
        )),
        body: Stack(
          children: [
            PDFView(
              filePath: widget.path,
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: false,
              onRender: (pages) {
                setState(() {
                  _pages = pages;
                  isReady = true;
                });
              },
            )
          ],
        )));
  }
}
