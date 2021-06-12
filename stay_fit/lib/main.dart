import 'package:flutter/material.dart';
import 'package:flutter_login_attempt/screens/home_page.dart';
import 'package:flutter_login_attempt/screens/login_screen.dart';
import 'package:flutter_login_attempt/screens/yoga_screen.dart';
import 'screens/options_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_page.dart';
import 'screens/profile_screen.dart';
import 'screens/wallet_screen.dart';
import 'screens/yoga_screen.dart';
import 'screens/meditation_screen.dart';

void main() => runApp(StayFit());

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
        '/yoga': (context) => YogaScreen(),
      },
    );
  }
}
