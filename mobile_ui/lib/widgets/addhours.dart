import 'package:flutter/material.dart';

class Addhours extends StatefulWidget {
  const Addhours({super.key});
  @override
  _AddhoursState createState() => _AddhoursState();
}

class _AddhoursState extends State<Addhours> {
  String? selected;
  List<String> items = ["1", "2", "3"];
  final TextEditingController _hourController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  String? errormessage;
  @override
  void dispose() {
    _hourController.dispose();
    _textController.dispose();
    super.dispose();
  }

  bool validhour() {
    if (_hourController.text.isEmpty) {
      errormessage = "请填写小时数";
      return false;
    } else if (double.tryParse(_hourController.text) == null) {
      errormessage = "小时数请填入数字";
      return false;
    } else if (double.parse(_hourController.text) <= 0 ||
        double.parse(_hourController.text) > 8) {
      errormessage = "小时数请填入1-8之间的数字";
      return false;
    } else {
      errormessage = null;
      return true;
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return (Container(
      color: Color(0xFFFFFFFF),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    gradient: LinearGradient(
                      colors: [Color(0xFF0064FF), Color(0xFF09C6F8)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(child: Image.asset('src/images/addHour.png')),
                ),
                SizedBox(width: 8),
                Text(
                  "新增工时",
                  style: TextStyle(
                    color: Color(0xFF050505),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: "PingFang SC",
                  ),
                ),
              ],
            ),
            Divider(color: Color(0xFFF0F0F2)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "所属项目",
                  style: TextStyle(
                    color: Color(0xFF050505),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: "PingFang SC",
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    icon: Image.asset('src/images/next.png'),
                    onChanged: (String? newvalue) {
                      setState(() {
                        selected = newvalue;
                      });
                    },
                    hint: Text(
                      '请选择',
                      style: TextStyle(
                        color: Color(0xFFC6C7CC),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "PingFang SC",
                      ),
                    ),
                    items: items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
            Divider(color: Color(0xFFF0F0F2)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "日期",
                  style: TextStyle(
                    color: Color(0xFF050505),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: "PingFang SC",
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      icon: Image.asset('src/images/next.png'),
                      onChanged: (String? newvalue) {
                        setState(() {
                          selected = newvalue;
                        });
                      },
                      hint: Text(
                        '请选择',
                        style: TextStyle(
                          color: Color(0xFFC6C7CC),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: "PingFang SC",
                        ),
                      ),
                      items:
                          items.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
              ],
            ),
            Divider(color: Color(0xFFF0F0F2)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "工时(h)",
                  style: TextStyle(
                    color: Color(0xFF050505),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: "PingFang SC",
                  ),
                ),
                SizedBox(width: 10),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: TextField(
                    controller: _hourController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF0064FF), width: 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      hintText: "请输入",
                      hintStyle: TextStyle(
                        color: Color(0xFFC6C7CC),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "PingFang SC",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(color: Color(0xFFF0F0F2)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "备注",
                  style: TextStyle(
                    color: Color(0xFF050505),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: "PingFang SC",
                  ),
                ),
                SizedBox(width: 10),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: TextField(
                    controller: _textController,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF0064FF), width: 0.5),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      hintText: "请输入",
                      hintStyle: TextStyle(
                        color: Color(0xFFC6C7CC),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "PingFang SC",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(color: Color(0xFFF0F0F2)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFFFFF),
                    side: BorderSide(color: Color(0xFFBDC2D2), width: 0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    fixedSize: Size(150, 40),
                    alignment: Alignment.center,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('src/images/save2.png'),
                      SizedBox(width: 2),
                      Text(
                        '保存',
                        style: TextStyle(
                          color: Color(0xFF17181A),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          fontFamily: "PingFang SC",
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0064FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    fixedSize: Size(150, 40),
                    alignment: Alignment.center,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('src/images/rocket.png'),
                      SizedBox(width: 2),
                      Text(
                        '提交',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          fontFamily: "PingFang SC",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
