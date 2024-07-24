import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Hours extends StatefulWidget {
  final String token;
  final Function(DateTime) pointedAT;
  const Hours({super.key, required this.token, required this.pointedAT});

  @override
  _HoursState createState() => _HoursState();
}

class _HoursState extends State<Hours> {
  DateTime focused = DateTime.now();
  DateTime? selected;

  DateTime? firstDay = DateTime(DateTime.now().year, DateTime.now().month, 1);
  late DateTime lastDay;
  bool isLoading = true;
  late Map<DateTime, List<dynamic>> event;

  @override
  int NumberofDays(DateTime date) {
    DateTime firstDayNextMonth = (date.month < 12)
        ? DateTime(date.year, date.month + 1, 1)
        : DateTime(date.year + 1, 1, 1);
    DateTime lastDay = firstDayNextMonth.subtract(Duration(days: 1));
    return lastDay.day;
  }

  DateTime _noZone(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  void getLastDay() {
    int days = NumberofDays(firstDay!);
    lastDay = DateTime(firstDay!.year, firstDay!.month, days);
    log("firstDay: $firstDay");
    log('Last day of month: $lastDay');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() => selected = null);
    getLastDay();
    fetchEventData();
  }

  void fetchEventData() async {
    List<String> eventData = await getEvent(widget.token);
    DateTime test = DateTime(2024, 7, 2);
    // log("test2 " + test.toString());
    // log('Fetched event data: $eventData'); // Added log for debugging
    setState(() {
      event = {};
      for (String date in eventData) {
        DateTime parsedDate = DateTime.parse(date);
        log(parsedDate.toString());
        DateTime dateWithoutTime =
            DateTime(parsedDate.year, parsedDate.month, parsedDate.day);
        log(dateWithoutTime.toString());
        event[dateWithoutTime] = [Color(0xFF0064FF)];
      }
      isLoading = false;
    });
    // log("event: $event");
  }

  Future<List<String>> getEvent(String token) async {
    final url = Uri.parse(
        'http://223.68.128.86:28218/manage/ServletCtrl?uuid=&token=' + token);
    final header = {"content-type": "text/html;charset=UTF-8"};
    Map<String, dynamic> data = {
      "name": "com.zfkj.business.xmxx.Gsxx.queryData",
      "data": {
        "start_date": firstDay!.toIso8601String(),
        "end_date": lastDay.toIso8601String(),
      }
    };
    final jsonData = jsonEncode(data);
    final response = await http.post(url, headers: header, body: jsonData);
    if (response.statusCode == 200) {
      log("returned is " + Uri.decodeComponent(response.body));
      List<dynamic> gsxx =
          jsonDecode(Uri.decodeComponent(response.body))['data']['gsxx'];
      log('gsxx: $gsxx');
      List<String> dates = gsxx.map<String>((entry) => entry['rq']).toList();
      log("Dates extracted: $dates");
      return dates;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return (ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 400),
          child: Stack(
            children: [
              TableCalendar(
                  locale: 'zh_CN',
                  calendarStyle: CalendarStyle(
                      defaultTextStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: "PingFang SC",
                        color: Color(0xFF050505),
                        fontWeight: FontWeight.w400,
                      ),
                      todayDecoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF0064FF),
                            width: 1,
                          ),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      todayTextStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: "PingFang SC",
                        color: Color(0xFF050505),
                        fontWeight: FontWeight.w400,
                      ),
                      markersMaxCount: 10,
                      selectedDecoration: BoxDecoration(
                        color: Color(0xFF0064FF),
                        shape: BoxShape.rectangle,
                      ),
                      selectedTextStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: "PingFang SC",
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w400,
                      )),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      selected = selectedDay;
                      focused = focusedDay;
                    });
                    log("selected:::: $selectedDay");
                    log("selected???? $selected");
                    widget.pointedAT(selectedDay);
                  },
                  calendarBuilders:
                      CalendarBuilders(markerBuilder: (context, date, events) {
                    DateTime datewithoutzone = _noZone(date);
                    // log('Checking date: $date'); //
                    //log(event[datewithoutzone].toString());
                    if (event[datewithoutzone] != null) {
                      // log('Marking date: $date'); // Debug statement

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: event[datewithoutzone]!.map((color) {
                          //log(color.toString());
                          return Row(
                            children: [
                              Container(
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: color as Color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      4), // Adjust width to change the gap size
                            ],
                          );
                        }).toList(),
                      );
                    }
                    return null;
                  }),
                  selectedDayPredicate: (day) => isSameDay(selected, day),
                  headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(
                        color: Color(0xFF050505),
                        fontFamily: "PingFang SC",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      )),
                  focusedDay: focused,
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31))
            ],
          )));
    }
  }
}
