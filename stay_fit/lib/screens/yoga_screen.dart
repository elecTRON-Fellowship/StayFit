import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'dart:io';
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

    if (counter >= count) {
      completeWorkout();
      setState(() {
        counter = count;
      });
      sleep(const Duration(seconds: 2));
      return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 0.5,
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
                top: 30,
                bottom: 30,
              ),
              margin: const EdgeInsets.only(
                bottom: 20,
                left: 30,
                right: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Great job!",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.check_circle,
                    size: 200,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/pose");
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff363636)),
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
                          "Go Back",
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ));
    }

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(),
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
