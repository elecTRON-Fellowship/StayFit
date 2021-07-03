import 'dart:async';
import 'package:camera/camera.dart';

import 'package:flutter/material.dart';

import 'screens/options_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/wallet_screen.dart';
import 'screens/yoga_screen.dart';
import 'screens/meditation_screen.dart';
import 'screens/pose_options_screen.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(StayFit());
}

class StayFit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StayFit",
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => OptionsScreen(),
        "/profile": (context) => ProfileScreen(),
        "/wallet": (context) => WalletScreen(),
        "/meditation": (context) => MeditationScreen(),
        "/pose": (context) => PoseOptionScreen(),
        "/yoga": (context) => YogaScreen(cameras),
      },
    );
  }
}