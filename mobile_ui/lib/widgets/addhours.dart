import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'package:intl/intl.dart';

class Addhours extends StatefulWidget {
  final String token;
  final DateTime? current;
  const Addhours({super.key, required this.token, required this.current});
  @override
  _AddhoursState createState() => _AddhoursState();
}

class _AddhoursState extends State<Addhours> {
  //bool deleted = false;
  late String hours;
  late String notes;
  String? selected;
  late DateTime selectDate;
  List<Map<String, dynamic>> XM = [];
  String? errorMsg;
  final TextEditingController _hourController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  String? errormessage;
  bool toggled = false;
  @override
  void dispose() {
    _hourController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fetchedXM();

    (widget.current != null)
        ? selectDate = widget.current!
        : selectDate = DateTime.now();
    _check();

    _hourController.addListener(_check);
    _textController.addListener(_check);
  }

  void _check() {
    String hour = _hourController.text;
    String note = _textController.text;
    setState(() {
      hours = hour;
      notes = note;
      //deleted = (hours.isNotEmpty && selected!.isNotEmpty);
    });
  }

  void _fetchedXM() async {
    try {
      final data = await _getXM(widget.token);
      setState(() {
        XM = data;
        errorMsg = null;
      });
    } catch (e) {
      setState(() {
        XM = [];
        errorMsg = "获取项目信息失败" + e.toString();
      });
    }
  }

  void toggle() {
    setState(() => toggled = !toggled);
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

  Future<List<Map<String, dynamic>>> _getXM(String token) async {
    final url = Uri.parse(
        "http://223.68.128.86:28218/manage/ServletCtrl?uuid=&token=" + token);
    final header = {"content-type": "text/html;charset=UTF-8"};
    final Map<String, dynamic> data = {
      "name": "com.zfkj.core.Common.queryData",
      "data": {
        "tablename": "xmglxt_xmxx",
        "search_condition": [],
      }
    };
    final jsonData = jsonEncode(data);
    final response = await http.post(url, body: jsonData, headers: header);
    if (response.statusCode == 200) {
      log("XM fetched^^: ${Uri.decodeComponent(response.body)}");
      final decodeData = jsonDecode(Uri.decodeComponent(response.body));
      return (decodeData['data']['xmglxt_xmxx'] as List)
          .map((item) => {"xmmc": item['xmmc'], "xmbh": item['xmbh']})
          .toList();
    } else {
      log("failed to fetch XM");
      throw Exception("数据读取失败");
    }
  }

  @override
  Widget build(BuildContext context) {
    return (GestureDetector(
        onTap: () {
          // This hides the keyboard if any text field has focus
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(children: [
          Container(
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
                        child: Center(
                            child: Image.asset('src/images/addHour.png')),
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
                          value: selected,
                          isExpanded: true,
                          icon: Image.asset('src/images/next.png'),
                          onChanged: (newvalue) {
                            setState(() {
                              selected = newvalue;
                            });
                          },
                          style: TextStyle(
                            color: Color(0xFF050505),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: "PingFang SC",
                          ),
                          underline: SizedBox.shrink(),
                          hint: Text(
                            '请选择项目',
                            style: TextStyle(
                              color: Color(0xFFC6C7CC),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: "PingFang SC",
                            ),
                          ),
                          items: XM.map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value["xmbh"],
                              child: Text(value['xmmc']),
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
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  selectDate.toIso8601String().substring(0, 10),
                                  style: TextStyle(
                                    color: Color(0xFF050505),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "PingFang SC",
                                  )),
                              GestureDetector(
                                onTap: toggle,
                                child: Image.asset('src/images/next.png'),
                              )
                            ]),
                      )
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
                          fontSize: 15,
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
                                borderSide: BorderSide(
                                    color: Color(0xFF0064FF), width: 0.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
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
                                borderSide: BorderSide(
                                    color: Color(0xFF0064FF), width: 0.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //if (deleted)
                      // ElevatedButton(
                      //   onPressed: () {},
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Color(0xFFFFFFFF),
                      //     side: BorderSide(
                      //         color: Color(0xFFBDC2D2), width: 0.5),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(4)),
                      //     ),
                      //     alignment: Alignment.center,
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       Image.asset('src/images/delete.png'),
                      //       SizedBox(width: 2),
                      //       Text(
                      //         '删除',
                      //         style: TextStyle(
                      //           color: Color(0xFFFE3B44),
                      //           fontSize: 13,
                      //           fontWeight: FontWeight.w600,
                      //           fontFamily: "PingFang SC",
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFFFFFF),
                          side:
                              BorderSide(color: Color(0xFFBDC2D2), width: 0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          alignment: Alignment.center,
                        ),
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('src/images/save2.png'),
                                SizedBox(width: 5),
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
                            )),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0064FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          alignment: Alignment.center,
                        ),
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('src/images/rocket.png'),
                                SizedBox(width: 5),
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
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          (toggled)
              ? GestureDetector(
                  onTap: toggle,
                  child: Container(
                      height: 350,
                      color: Colors.black54,
                      child: Container(
                          color: Colors.white,
                          child: ScrollDatePicker(
                            scrollViewOptions: DatePickerScrollViewOptions(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            selectedDate: selectDate,
                            locale: Locale('ch'),
                            onDateTimeChanged: (DateTime val) {
                              setState(() {
                                selectDate = val;
                              });
                            },
                          ))))
              : SizedBox.shrink()
        ])));
  }
}
