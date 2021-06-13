import 'package:flutter/material.dart';

import 'dart:async';
import 'package:camera/camera.dart';

import 'screens/options_screen.dart';
import 'screens/home_page.dart';
import 'screens/profile_screen.dart';
import 'screens/wallet_screen.dart';
import 'screens/yoga_screen.dart';
import 'screens/meditation_screen.dart';

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
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/options': (context) => OptionsScreen(),
        '/profile': (context) => ProfileScreen(),
        '/wallet': (context) => WalletScreen(),
        '/meditation': (context) => MeditationScreen(),
        '/yoga': (context) => YogaScreen(cameras),
      },
    );
  }
}

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';

// late List<CameraDescription> cameras;

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   cameras = await availableCameras();
//   runApp(CameraApp());
// }

// class CameraApp extends StatefulWidget {
//   @override
//   _CameraAppState createState() => _CameraAppState();
// }

// class _CameraAppState extends State<CameraApp> {
//   late CameraController controller;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = CameraController(cameras[1], ResolutionPreset.max);
  //   controller.initialize().then((_) {
  //     if (!mounted) {
  //       return;
  //     }
  //     setState(() {});
  //   });
  // }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!controller.value.isInitialized) {
//       return Container();
//     }
//     return MaterialApp(
//       home: CameraPreview(controller),
//     );
//   }
// }
