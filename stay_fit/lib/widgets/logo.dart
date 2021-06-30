import 'package:flutter/material.dart';

class StayFitLogo extends StatelessWidget {
  
  StayFitLogo(this.width, this.height);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      child: Image.asset('assets/image/logo.png'),
    );
  }
}