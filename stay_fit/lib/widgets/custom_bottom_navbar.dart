import 'package:flutter/material.dart';

class CustomBottonNavBar extends StatelessWidget {
  const CustomBottonNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(52),
          topRight: Radius.circular(52),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xff00ffb2), Color(0xd600e0ff)],
        ),
      ),
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 21,
        bottom: 21,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NavBarButton(Icon(Icons.home), 'Home', '/options'),
          NavBarButton(Icon(Icons.person), 'Profile', '/profile'),
          NavBarButton(Icon(Icons.account_balance_wallet), 'Wallet', '/wallet'),
        ],
      ),
    );
  }
}

class NavBarButton extends StatelessWidget {
  const NavBarButton(this.icon, this.label, this.route);

  final Widget icon;
  final String label;
  final String route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          this.icon,
          Text(
            this.label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff151515),
              fontSize: 13,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, this.route);
      },
    );
  }
}
