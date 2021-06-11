import 'package:flutter/material.dart';

import '../widgets/custom_bottom_navbar.dart';
import '../widgets/option_card.dart';

class OptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: CustomBottonNavBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/image/cropped_logo.png', height: 50),
            OptionCard(
              "Meditation",
              "Start your day\nby spending some\ntime with yourself.",
              Image.asset("assets/image/meditation.png", height: 85),
              "/meditation",
            ),
            OptionCard(
              "Yoga",
              "Time to move some\nmuscles and get\nthe blood flowing.",
              Image.asset("assets/image/downdog_pose.png", height: 80),
              "/yoga",
            ),
          ],
        ),
      ),
    );
  }
}
