import 'package:flutter/material.dart';

import '../widgets/custom_bottom_navbar.dart';

class OptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottonNavBar(),
      ),
    );
  }
}
