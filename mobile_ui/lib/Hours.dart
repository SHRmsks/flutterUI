import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Hours extends StatefulWidget {
  final String token;
  const Hours({super.key, required this.token});
  @override
  _HoursState createState() => _HoursState();
}

class _HoursState extends State<Hours> {
  bool waiting = false;
  bool hold = false;
  bool submit = false;
  @override
  Widget build(BuildContext context) {
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
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    todayTextStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: "PingFang SC",
                      color: Color(0xFF050505),
                      fontWeight: FontWeight.w400,
                    ),
                    markerDecoration: BoxDecoration(
                      color: waiting
                          ? Color(0xFFC6C7CC)
                          : hold
                              ? Color(0xFF0064FF)
                              : submit
                                  ? Color(0xFF78CE24)
                                  : Colors.transparent,
                    )),
                calendarBuilders: CalendarBuilders(
                    // markerBuilder: ( context, day, events){

                    // }

                    ),
                headerStyle: HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                    titleTextStyle: TextStyle(
                      color: Color(0xFF050505),
                      fontFamily: "PingFang SC",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    )),
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31))
          ],
        )));
  }
}
