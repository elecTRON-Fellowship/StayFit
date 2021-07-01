import 'package:flutter/material.dart';

class CountButton extends StatelessWidget {
  const CountButton(this.count, this.pose);
  final int count;
  final String pose;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.pushNamed(context, "/yoga",
            arguments: {"count": count, "pose": pose});
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xff363636)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.0),
          ),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: 25,
        child: Center(
          child: Text(
            count.toString(),
            style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
