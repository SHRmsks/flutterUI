import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Taskhour extends StatefulWidget {
  final String time;
  final String task;
  final String notes;
  final void Function(int) onDelete;
  final int index;
  @override
  const Taskhour({
    super.key,
    required this.time,
    required this.task,
    required this.notes,
    required this.onDelete,
    required this.index,
  });
  @override
  _TaskhourState createState() => _TaskhourState();
}

class _TaskhourState extends State<Taskhour> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(3)),
        color: Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              constraints: BoxConstraints(maxWidth: 60, maxHeight: 76),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  gradient: LinearGradient(
                      colors: [Color(0xFFBBBED0), Color(0xFFBFC4DF)],
                      begin: Alignment.topRight,
                      end: AlignmentDirectional.bottomStart)),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.time + "h",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "PingFang SC"),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '未提交',
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: "PingFang SC"),
                  )
                ],
              ))),
          Expanded(
              child: ClipRect(
                  child: Slidable(
            direction: Axis.horizontal,
            endActionPane: ActionPane(
              dragDismissible: false,
              motion: const DrawerMotion(),
              extentRatio: 0.6,
              children: [
                CustomSlidableAction(
                  onPressed: (context) {},
                  backgroundColor: Color(0xFF78CE24),
                  foregroundColor: Colors.white,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('src/images/rocket.png'),
                        Text('提交',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: "PingFang SC"))
                      ]),
                ),
                CustomSlidableAction(
                    onPressed: (context) {},
                    backgroundColor: Color(0xFFFFA000),
                    foregroundColor: Colors.white,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('src/images/modify.png'),
                          Text('编辑',
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "PingFang SC"))
                        ])),
                CustomSlidableAction(
                    onPressed: (context) {
                      widget.onDelete(widget.index);
                    },
                    backgroundColor: Color(0xFFFE3B44),
                    foregroundColor: Colors.white,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('src/images/deleteW.png'),
                          Text('删除',
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "PingFang SC"))
                        ]))
              ],
            ),
            child: ListTile(
              tileColor: Color(0xFFFFFFFF),
              title: Text(widget.task,
                  style: TextStyle(
                    color: Color(0xFF050505),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: "PingFang SC",
                  )),
              subtitle: Text(widget.notes,
                  style: TextStyle(
                    color: Color(0xFF46484D),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: "PingFang SC",
                    overflow: TextOverflow.ellipsis,
                  )),
            ),
          )))
        ],
      ),
      alignment: Alignment.centerRight,
    );
  }
}
