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

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[1], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
      controller.startImageStream((CameraImage img) {
        var im = img.planes.map((plane) {
              return plane.bytes;
            }).toList();
        log(im.length.toString());
        log(im[0].length.toString());
        if (!isDetecting) {
          isDetecting = true;
          Tflite.runModelOnFrame(
            bytesList: img.planes.map((plane) {
              return plane.bytes;
            }).toList(),
            threshold: 0.65,
            numResults: 5,
          ).then((recognitions) {
            log(recognitions![0]["label"]);
            if (recognitions[0]["label"] == pose){
              incrementCounter();
            }
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
