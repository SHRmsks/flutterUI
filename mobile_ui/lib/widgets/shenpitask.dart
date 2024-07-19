import "package:flutter/material.dart";

class Suggestion extends StatefulWidget {
  // final Function(double) ChangedHeight;
  const Suggestion({super.key/*,required this.ChangedHeight*/});
  @override
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  double _movements = 30.0;

  void _setHeight(DragUpdateDetails details) {
    setState(() {
      _movements -= details.delta.dy;
      if (_movements < 30) _movements = 30;

      if (_movements > 400) _movements = 400;
      // widget.ChangedHeight(_movements);
    });
  }

  @override
  Widget build(BuildContext context) {
    return (GestureDetector(
        onVerticalDragUpdate: _setHeight,
        child: Container(
            color: Color(0xFFFFFFFF),
            height: _movements,
            child: (Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('src/images/expand.png'),
                  Divider(color: Color(0xFFF0F0F2)),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('src/images/shenpisuggestion.png'),
                                SizedBox(width: 8),
                                Text('审批意见',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF050505),
                                        fontFamily: "PingFang SC")),
                              ],
                            ),
                            Divider(color: Color(0xFFF0F0F2)),
                            TextField(
                              maxLines: null,
                              decoration: InputDecoration(
                                  hintText: "请输入",
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFC6C7CC),
                                    fontFamily: "PingFang SC",
                                  )),
                            )
                          ],
                        )),
                  ))
                ])))));
  }
}
