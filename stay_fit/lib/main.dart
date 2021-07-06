import 'dart:async';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/options_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/wallet_screen.dart';
import 'screens/yoga_screen.dart';
import 'screens/meditation_screen.dart';
import 'screens/pose_options_screen.dart';
import 'package:stay_fit/screens/meditation_screen.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(StayFit());
}

class StayFit extends StatefulWidget {
  @override
  _StayFitState createState() => _StayFitState();
}

class _StayFitState extends State<StayFit> {
  bool _initialized = false;
  bool _error = false;

  initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return SomethingWentWrong();
    }
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

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: Scaffold(
        body: Center(
          child: Container(
            child: Center(child: Text("Something Went Wrong!")),
          ),
        ),
      ),
    );
  }
}
