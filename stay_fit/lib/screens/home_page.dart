import 'package:flutter/material.dart';

import '../widgets/logo.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 560,
        height: 640,
        color: Color(0xff151515),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StayFitLogo(double.infinity, 566.0),
            GetStartedTray(),
          ],
        ),
      ),
    );
  }
}

class GetStartedTray extends StatefulWidget {
  const GetStartedTray({Key? key}) : super(key: key);

  @override
  _GetStartedTrayState createState() => _GetStartedTrayState();
}

class _GetStartedTrayState extends State<GetStartedTray> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 560,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(52),
          topRight: Radius.circular(52),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
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
          colors: [Color(0xff00ffb2), Color(0xd600e0ff)],
        ),
      ),
      padding: const EdgeInsets.only(
        left: 82,
        right: 83,
        top: 21,
        bottom: 27,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 195,
            height: 36,
            child: GestureDetector(
              child: Text(
                "Get Started",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff151515),
                  fontSize: 32,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/options');
              },
            ),
          ),
        ],
      ),
    );
  }
}
