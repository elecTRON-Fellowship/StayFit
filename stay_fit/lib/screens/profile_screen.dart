import 'package:flutter/material.dart';

import '../widgets/custom_bottom_navbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      backgroundColor: Color(0xffffffff),
      bottomNavigationBar: CustomBottonNavBar(),
    );
  }
}
