import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 560,
      height: 740,
      color: Color(0xff151515),
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 560,
                height: 430,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(52),
                    topRight: Radius.circular(52),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
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
                  left: 14,
                  right: 15,
                  top: 19,
                  bottom: 23,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 313,
                      height: 55,
                      child: Text(
                        "Create Account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff151515),
                          fontSize: 36,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 25.50),
                    Container(
                      width: 300,
                      height: 40,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 300,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0x3f000000),
                            ),
                            padding: const EdgeInsets.only(
                              left: 17,
                              right: 237,
                              top: 11,
                              bottom: 6,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Name",
                                  style: TextStyle(
                                    color: Color(0xff242424),
                                    fontSize: 15,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25.50),
                    Container(
                      width: 300,
                      height: 40,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 300,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0x3f000000),
                            ),
                            padding: const EdgeInsets.only(
                              left: 17,
                              right: 223,
                              top: 11,
                              bottom: 6,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Email Id",
                                  style: TextStyle(
                                    color: Color(0xff242424),
                                    fontSize: 15,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25.50),
                    Container(
                      width: 300,
                      height: 40,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 300,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0x3f000000),
                            ),
                            padding: const EdgeInsets.only(
                              left: 17,
                              right: 210,
                              top: 11,
                              bottom: 6,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Password",
                                  style: TextStyle(
                                    color: Color(0xff242424),
                                    fontSize: 15,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25.50),
                    Container(
                      width: 150,
                      height: 40,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0x3f000000),
                            ),
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 15,
                              top: 8,
                              bottom: 9,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Create Account",
                                  style: TextStyle(
                                    color: Color(0xff151515),
                                    fontSize: 15,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25.50),
                    Container(
                      width: 331,
                      height: 2,
                      color: Color(0x7fc4c4c4),
                    ),
                    SizedBox(height: 25.50),
                    Text(
                      "Already have an account? Log In",
                      style: TextStyle(
                        color: Color(0xff242424),
                        fontSize: 12,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 420,
                height: 420,
                child: Image.asset('assets/Logo.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
 
*/