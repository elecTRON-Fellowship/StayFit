import 'package:flutter/material.dart';

import './count_button.dart';

class CountSelectWidget extends StatefulWidget {
  const CountSelectWidget(this.pose);
  final pose;

  @override
  _CountSelectWidgetState createState() => _CountSelectWidgetState(this.pose);
}

class _CountSelectWidgetState extends State<CountSelectWidget> {
  @override
  _CountSelectWidgetState(this.pose);
  final pose;

  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(15),
        height: 320,
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Set reps:",
              style: TextStyle(
                fontSize: 25,
                fontFamily: "Poppins",
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CountButton(5, pose),
                CountButton(10, pose),
                CountButton(15, pose),
                CountButton(20, pose),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
