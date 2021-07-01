import 'package:flutter/material.dart';

import './count_select_widget.dart';

class PoseOptionCard extends StatelessWidget {
  PoseOptionCard(this.title, this.image, this.route);

  final Image image;
  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
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
          colors: [Color(0xff000000), Color(0xff434343)],
        ),
      ),
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 30,
        bottom: 30,
      ),
      margin: const EdgeInsets.only(
        bottom: 20,
        left: 20,
        right: 20,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                this.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 25,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierColor: Colors.black87,
                    builder: (context) {
                      return Center(
                        child: CountSelectWidget(this.title),
                      );
                    },
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xff363636)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                  ),
                ),
                child: Text(
                  '   Start   ',
                  style: TextStyle(color: Color(0xffffffff)),
                ),
              )
            ],
          ),
          this.image,
        ],
      ),
    );
  }
}
