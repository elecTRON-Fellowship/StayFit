import 'package:flutter/material.dart';

import '../widgets/custom_bottom_navbar.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
      ),
      backgroundColor: Color(0xff151515),
      bottomNavigationBar: CustomBottonNavBar(),
    );
  }
}
