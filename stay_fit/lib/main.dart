import 'package:flutter/material.dart';
import 'package:flutter_login_attempt/screens/home_page.dart';
import 'package:flutter_login_attempt/screens/login_screen.dart';
import 'screens/first_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: HomePage(),
    );
  }
}
