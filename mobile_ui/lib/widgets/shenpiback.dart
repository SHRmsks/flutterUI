import "package:flutter/material.dart";

class SPback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset("src/images/pop.png")),
        SizedBox(width: 5),
        Text(
          "审批",
          style: TextStyle(
              fontSize: 20,
              color: Color(0xFF2D2D2D),
              fontFamily: "PingFang TC",
              fontWeight: FontWeight.w600),
        )
      ],
    ));
  }
}
