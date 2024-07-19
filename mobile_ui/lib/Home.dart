import 'dart:developer';
import 'package:http/http.dart' as http;
import "package:flutter/material.dart";
import './widgets/toolbox_Row.dart';
import './widgets/Top.dart';
import './widgets/daibanWidget.dart';
import "dart:convert";
import './widgets/taskgenerate.dart';
import './widgets/Mine.dart';
import './Hours.dart';
import './widgets/addhours.dart';
import 'dart:ui';
import 'package:intl/intl.dart';
import './widgets/hourGenerator.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String token;
  String userID = "";
  bool hour = false;
  late String name;
  bool addHour = false;

  late Future<String> workflowdata;
  int _selectedIndex = 0;

  void _addhour() {
    setState(() => addHour = true);
  }

  void _removeHour() {
    setState(() => addHour = false);
  }

  int _updateIndex(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
      if (newIndex == 1) {
        hour = true;
      } else {
        hour = false;
      }
    });
    return 0;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)!.settings.arguments;
      if (args != null) {
        setState(() {
          token = args as String;
          workflowdata = _getTasks(token);
        });
        log(token);

        // workflowdata?.then((value) => log('Workflow data: $value'));
      }
    });
    // log(token);
  }

  Future<String> _getTasks(String token) async {
    final url1 = Uri.parse(
        "http://223.68.128.86:28218/manage/ServletCtrl?uuid=&token=" + token);
    final header1 = {"content-type": "text/html;charset=UTF-8"};
    Map<String, String> data1 = {"name": "com.zfkj.core.Common.getSessionData"};
    final jsondata1 = jsonEncode(data1);

    final response1 = await http.post(url1, headers: header1, body: jsondata1);
    if (response1.statusCode == 200) {
      log("test" + Uri.decodeComponent(response1.body));
      final responsedata = jsonDecode(Uri.decodeComponent(response1.body));

      userID = responsedata["data"]["user_id"];
      name = responsedata["data"]["user_name"];
      log("user_ID" + userID);
    }

    final url = Uri.parse(
        "http://223.68.128.86:28218/manage/ServletCtrl?uuid=&token=" + token);
    final header = {"content-type": "text/html;charset=UTF-8"};
    Map<String, Object> data = {
      "name": "com.zfkj.core.Common.queryData",
      "data": {
        "datasource": "ds_query_todolist",
        "param": [userID]
      }
    };
    final jsondata = jsonEncode(data);
    final response = await http.post(url, headers: header, body: jsondata);
    if (response.statusCode == 200) {
      log(Uri.decodeComponent(response.body));

      return Uri.decodeComponent(response.body);
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      (_selectedIndex == 1)
          ? Positioned.fill(
              child: Stack(children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 240, // predefined height
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('src/images/bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ]))
          : SizedBox.shrink(),

      Container(
          color: hour ? Colors.transparent : Color(0xFFFFFFFF),
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 44),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Top(index: _selectedIndex),
              (_selectedIndex == 0)
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height - 100,
                      child: FutureBuilder(
                          future: workflowdata,
                          builder: (context, snapshot) {
                            if (snapshot.hasData &&
                                snapshot.data != null &&
                                snapshot.data!.isNotEmpty) {
                              log("snap" + snapshot.data!);

                              return TaskGenerate(
                                  workdata: snapshot.data!, token: token);
                            } else {
                              return Center(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                    CircularProgressIndicator(),
                                    SizedBox(width: 20),
                                    Text("正在加载中...")
                                  ]));
                            }
                          }))
                  : const SizedBox.shrink(),
              (_selectedIndex == 1)
                  ? Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          Hours(token: token),
                          Divider(color: Color(0xFFF0F0F2)),
                          TextButton.icon(
                            onPressed: _addhour,
                            icon: Image.asset('src/images/addnew.png'),
                            label: Text(
                              "新增",
                              style: TextStyle(
                                  color: Color(0xFF0064FF),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "PingFang SC"),
                            ),
                          ),
                          Expanded(child: HourGenerate(date: "2"))
                        ]))
                  : const SizedBox.shrink(),
              (_selectedIndex == 4)
                  ? Mine(user_id: userID, token: token, name: name)
                  : const SizedBox.shrink(),
            ]),
          )),

      // Your other widgets go here
      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Toolbox(onButtonPressed: _updateIndex),
      ),
      (addHour)
          ? Positioned.fill(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: _removeHour,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(color: Colors.white.withOpacity(0.13)),
                    ),
                  ),
                  Positioned(left: 0, right: 0, bottom: 0, child: Addhours())
                ],
              ),
            )
          : SizedBox.shrink()
    ]));
  }
}
