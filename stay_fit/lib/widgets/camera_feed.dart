import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';

typedef void Callback();

class CameraFeed extends StatefulWidget {
  CameraFeed(this.cameras, this.pose, this.incrementCounter);
  List<CameraDescription> cameras;
  final String pose;
  final Callback incrementCounter;

  @override
  _CameraFeedState createState() =>
      _CameraFeedState(cameras, pose, incrementCounter);
}

class _CameraFeedState extends State<CameraFeed> {
  _CameraFeedState(this.cameras, this.pose, this.incrementCounter);
  List<CameraDescription> cameras;
  late CameraController controller;
  final String pose;
  final Callback incrementCounter;
  bool isDetecting = false;
  var times = 0;
  
  
  increaseTimes () {
    setState(() {
      times++;
    });
  }

  @override
  void initState() {
    super.initState();
    log("SUPER INITSTATE WORKED");
    controller = CameraController(cameras[1], ResolutionPreset.max);
    log("CONTROLLER DECLARED");
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      log("CONTROLLER INITIALIZED");
      setState(() {});
      controller.startImageStream((CameraImage img) {
        if (!isDetecting) {
          isDetecting = true;
          Tflite.runModelOnFrame(
            bytesList: img.planes.map((plane) {
              return plane.bytes;
            }).toList(),
            imageHeight: 224,
            imageWidth: 224,
          ).then((recognitions) {
            log(recognitions.toString());
            log("TIMES = $times");
            increaseTimes();
            isDetecting = false;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CameraPreview(controller);
  }
}
