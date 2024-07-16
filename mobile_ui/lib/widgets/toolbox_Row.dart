import "package:flutter/material.dart";

class Toolbox extends StatefulWidget {
  final int Function(int) onButtonPressed;
  const Toolbox({super.key, required this.onButtonPressed});
  @override
  _ToolBoxState createState() => _ToolBoxState();
}

class _ToolBoxState extends State<Toolbox> {
  int _selectedButton = 0;
  @override
  void _click(int buttonIndex) {
    setState(() {
      _selectedButton = buttonIndex;
      widget.onButtonPressed(buttonIndex);
    });
  }

  Widget ResponsiveButton(int buttonindex, String defaultimg, String onchange) {
    return IconButton(
        icon: Stack(
          children: [
            Visibility(
                visible: _selectedButton == buttonindex,
                child: Image.asset(onchange)),
            Visibility(
                visible: _selectedButton != buttonindex,
                child: Image.asset(defaultimg))
          ],
        ),
        onPressed: () {
          _click(buttonindex);
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ResponsiveButton(
                    0, "src/images/daiban.png", "src/images/daibanB.png"),
                SizedBox(height: 3),
                Text(
                  "待办",
                  style: TextStyle(
                    color: Color(0xFF919399),
                    fontSize: 11,
                    fontFamily: "PingFang SC",
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.right,
                )
              ],
            )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ResponsiveButton(
                    1, "src/images/gongshi.png", "src/images/gongshiB.png"),
                SizedBox(height: 3),
                Text(
                  "工时",
                  style: TextStyle(
                    color: Color(0xFF919399),
                    fontSize: 11,
                    fontFamily: "PingFang SC",
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.right,
                )
              ],
            )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ResponsiveButton(
                    2, "src/images/xiangmu.png", "src/images/xiangmuB.png"),
                SizedBox(height: 3),
                Text(
                  "项目",
                  style: TextStyle(
                    color: Color(0xFF919399),
                    fontSize: 11,
                    fontFamily: "PingFang SC",
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ResponsiveButton(
                    3, "src/images/baoxiao.png", "src/images/baoxiaoB.png"),
                SizedBox(height: 3),
                Text(
                  "报销",
                  style: TextStyle(
                    color: Color(0xFF919399),
                    fontSize: 11,
                    fontFamily: "PingFang SC",
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ResponsiveButton(
                    4, "src/images/wode.png", "src/images/wodeB.png"),
                SizedBox(height: 3),
                Text(
                  "我的",
                  style: TextStyle(
                    color: Color(0xFF919399),
                    fontSize: 11,
                    fontFamily: "PingFang SC",
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ))
          ],
        ));
  }
}
