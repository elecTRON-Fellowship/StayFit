import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'dart:async';

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
  var borderColor = Colors.red;

  Future<void> loadCamera() async {
    this.cameras = await availableCameras();
  }

  @override
  void initState() {
    super.initState();
    loadCamera();
    controller = CameraController(cameras[1], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff151515),
      appBar: AppBar(
        title: Text("Yoga"),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        color: borderColor,
        child: CameraPreview(controller),
      ),
    );
  }
}