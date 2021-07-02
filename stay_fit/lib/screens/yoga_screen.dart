import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'package:tflite/tflite.dart';

import '../widgets/camera_feed.dart';

class YogaScreen extends StatefulWidget {
  YogaScreen(this.cameras);

  final List<CameraDescription> cameras;

  @override
  _YogaScreenState createState() => _YogaScreenState(cameras);
}

class _YogaScreenState extends State<YogaScreen> {
  _YogaScreenState(this.cameras);

  List<CameraDescription> cameras;
  late CameraController controller;
  var borderColor = Color(0xff94000f);
  var counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void completeWorkout() {
    setState(() {
      borderColor = Color(0xff007d21);
    });
  }

  loadTfModel() async {
    await Tflite.loadModel(
      model: "assets/model/yoga_pose_mobilenet.tflite",
      labels: "assets/model/labels.txt",
    );
  }

  @override
  void initState() {
    super.initState();
    loadTfModel();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final count = arguments["count"];
    final pose = arguments["pose"];

    if (counter == count) {
      completeWorkout();
    }

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        title: Text("Yoga"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        color: borderColor,
        child: Stack(
          children: [
            CameraFeed(this.cameras, pose, incrementCounter),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
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
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "$counter / ${count.toString()}",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
