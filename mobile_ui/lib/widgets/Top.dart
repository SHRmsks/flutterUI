import "package:flutter/material.dart";

class Top extends StatefulWidget {
  final int index;
  const Top({super.key, required this.index});
  @override
  _TopState createState() => _TopState();
}

class _TopState extends State<Top> {
  Widget _Tasktitle(int index) {
    String title = '';
    switch (index) {
      case 0:
        title = "待办";
        break;
      case 1:
        title = "工时分配";
        break;
      case 2:
        title = "项目";
        break;
      case 3:
        title = "报销";
        break;
      case 4:
        title = "我的";
        break;
    }

    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Color(0xFF050505),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: "PingFang TC"),
              textAlign: TextAlign.left,
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _Tasktitle(widget.index),
        IconButton(
          icon: Icon(Icons.dangerous_outlined, color: Color(0xFFFE3B44)),
          onPressed: () {
            Navigator.maybePop(context);
          },
        )
      ],
    );
  }
}
