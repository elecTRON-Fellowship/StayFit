import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'package:http/http.dart' as http;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

const shift = (0xFF << 24);

FirebaseApp stayFit = Firebase.app('StayFit');
firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instanceFor(app: stayFit);

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
  var apiUrl =
      Uri.parse('http://default-tenant.app.mlops6.iguazio-c0.com:32700/');
  String imUrl = "NOT INITIALIZED";
  var responseData;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[1], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
      controller.startImageStream(
        (CameraImage img) {
          if (!isDetecting) {
            isDetecting = true;
            runInference(imUrl);
            uploadData(img.planes[0].bytes);
            Tflite.runModelOnFrame(
              bytesList: img.planes.map((plane) {
                return plane.bytes;
              }).toList(),
              threshold: 0.80,
              numResults: 5,
            ).then(
              (recognitions) {
                log(recognitions![0]["label"]);
                if (recognitions[0]["label"] == pose) {
                  incrementCounter();
                }
                isDetecting = false;
              },
            );
          }
        },
      );
    });
  }

  runInference(url) async {
    try {
      var response = await http.post(apiUrl, body: {"data_url": url});
      var resData = response.statusCode;
      setState(() {
        responseData = resData;
      });
    } catch (e) {
      log(e.toString());
    }
  }

  uploadData(bytes) async {
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref('uploads/img-${DateTime.now().hashCode}.jpg');
    log(ref.toString());
    try {
      var uploadTask = await ref.putData(bytes);
      var url = await ref.getDownloadURL();
      setState(() {
        imUrl = url;
      });
    } catch (e) {}
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
