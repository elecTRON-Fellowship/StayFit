import 'package:flutter/material.dart';
import 'package:custom_timer/custom_timer.dart';

class CountDownTimer extends StatefulWidget {
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  final CustomTimerController _controller = new CustomTimerController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xff000000), Color(0xff434343)],
        ),
      ),
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 10,
        bottom: 10, 
      ),
      margin: const EdgeInsets.only(
        top: 20,
        bottom: 20,
        left: 10,
        right: 10, 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
        children: <Widget>[
          CustomTimer(
            controller: _controller,
            from: Duration(minutes: 10),
            to: Duration(minutes: 0),
            interval: Duration(seconds: 1),
            builder: (CustomTimerRemainingTime remaining) {
              return Text(
                "${remaining.minutes}:${remaining.seconds}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
          SizedBox(
            height: 16.0,
          ),
          GestureDetector(
            onTap: () => _controller.start(),
            child: Container(
              margin: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: Icon(Icons.play_arrow_outlined, color: Colors.white, size: 30), 
            ),
          ),
          GestureDetector(
            onTap: () => _controller.pause(),
            child: Container(
              margin: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: Icon(Icons.pause, color: Colors.white, size: 30),
            ),
          ),
          GestureDetector( 
            onTap: () => _controller.reset(),
            child: Container(
              margin: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: Icon(Icons.replay, color: Colors.white, size: 30), 
            ),
          ),
        ],
      ),
    );
  }
}
