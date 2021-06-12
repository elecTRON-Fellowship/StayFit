import 'package:flutter/material.dart';

class YogaScreen extends StatelessWidget {
  const YogaScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff151515),
      appBar: AppBar(
        title: Text("Yoga"),
      ),
    );
  }
}