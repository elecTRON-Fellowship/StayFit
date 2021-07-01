import 'package:flutter/material.dart';
import '../widgets/custom_bottom_navbar.dart';
import '../widgets/pose_option_card.dart';

class PoseOptionScreen extends StatefulWidget {
  const PoseOptionScreen({Key? key}) : super(key: key);

  @override
  _PoseOptionScreenState createState() => _PoseOptionScreenState();
}

class _PoseOptionScreenState extends State<PoseOptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 20,
            bottom: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
              PoseOptionCard(
                "Downdog",
                Image.asset("assets/image/meditation.png", height: 85),
                "/meditation",
              ),
              PoseOptionCard(
                "Goddess",
                Image.asset("assets/image/downdog_pose.png", height: 80),
                "/pose",
              ),
              PoseOptionCard(
                "Plank",
                Image.asset("assets/image/meditation.png", height: 85),
                "/meditation",
              ),
              PoseOptionCard(
                "Tree",
                Image.asset("assets/image/downdog_pose.png", height: 80),
                "/pose",
              ),
              PoseOptionCard(
                "Warrior",
                Image.asset("assets/image/meditation.png", height: 85),
                "/meditation",
              ),
            ],
            )
          ),
        ),
      ),
      bottomNavigationBar: CustomBottonNavBar(),
    );
  }
}
