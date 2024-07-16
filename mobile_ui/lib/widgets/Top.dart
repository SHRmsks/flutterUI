import "package:flutter/material.dart";

class Top extends StatefulWidget {
  final int index;
  const Top({super.key, required this.index});
  @override
  _TopState createState() => _TopState();
}

class _TopState extends State<Top> {
  Widget _Tasktitle(int index) {
    if (index == 0) {
      return (Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "待办",
                style: TextStyle(
                    color: Color(0xFF050505),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: "PingFang TC"),
                textAlign: TextAlign.left,
              ),
            ]),
      ));
    } else if (index == 1) {
      return (Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "工时",
                style: TextStyle(
                    color: Color(0xFF050505),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'PingFang TC'),
                textAlign: TextAlign.left,
              ),
            ]),
      ));
    } else if (index == 2) {
      return (Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "项目",
                style: TextStyle(
                    color: Color(0xFF050505),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: "PingFang TC"),
                textAlign: TextAlign.left,
              ),
            ]),
      ));
    }
    if (index == 3) {
      return (Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "报销",
                style: TextStyle(
                    color: Color(0xFF050505),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: "PingFang TC"),
                textAlign: TextAlign.left,
              ),
            ]),
      ));
    } else if (index == 4) {
      return (Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "我的",
                style: TextStyle(
                    color: Color(0xFF050505),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: "PingFang TC"),
                textAlign: TextAlign.left,
              ),
            ]),
      ));
    } else {
      return (Container());
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Flex(
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
    ));
  }
}
