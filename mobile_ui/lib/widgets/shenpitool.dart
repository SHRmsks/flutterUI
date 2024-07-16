import 'package:flutter/material.dart';

class ShenpiTool extends StatefulWidget {
  const ShenpiTool({super.key});

  @override
  _ShenpiToolState createState() => _ShenpiToolState();
}

class _ShenpiToolState extends State<ShenpiTool> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 80),
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                backgroundColor: Color(0xFFFFFFFF),
                side: BorderSide(color: Color(0xFFBDC2D2), width: 0.5),
              ),
              icon: Image.asset("src/images/delete.png", height: 15, width: 15),
              label: Text(
                '删除',
                style: TextStyle(
                  color: Color(0xFFFE3B44),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  fontFamily: "PingFang SC",
                ),
                softWrap: false,
              ),
            ),
          ),

          // Add some spacing between buttons
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 80),
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  backgroundColor: Color(0xFFFFFFFF),
                  side: BorderSide(color: Color(0xFFBDC2D2), width: 0.5),
                ),
                icon: Image.asset("src/images/hold.png", height: 15, width: 15),
                label: Text(
                  '延缓',
                  style: TextStyle(
                    color: Color(0xFF17181A),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    fontFamily: "PingFang SC",
                  ),
                  softWrap: false,
                ),
              )),

          // Add some spacing between buttons
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 80),
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                backgroundColor: Color(0xFFFE3B44),
              ),
              icon: Image.asset("src/images/back.png", height: 15, width: 15),
              label: Text(
                '退回',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  fontFamily: "PingFang SC",
                ),
                softWrap: false,
              ),
            ),
          ),

          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 80),
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                backgroundColor: Color(0xFF0064FF),
              ),
              icon:
                  Image.asset("src/images/checked.png", height: 15, width: 15),
              label: Text(
                '同意',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  fontFamily: "PingFang SC",
                ),
                softWrap: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
