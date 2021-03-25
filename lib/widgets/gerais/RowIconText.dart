import 'package:flutter/material.dart';

class RowIconText extends StatelessWidget {

  final String text;
  final IconData icon;
  final Color color;
  final double fontSize;
  final double iconSize;

  RowIconText ({
    this.text,
    this.icon,
    this.color = const Color(0xff060056),
    this.fontSize = 24,
    this.iconSize = 30,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Icon(
            this.icon,
            size: this.iconSize,
            color: this.color,
          ),

          SizedBox (width: 10,),

          Text (
            this.text,
            style: TextStyle(
              fontSize: this.fontSize,
              fontWeight: FontWeight.bold,
              color: this.color,
              letterSpacing: 1,
            ),
            textAlign: TextAlign.start,
            overflow: TextOverflow.fade,
          ),

        ],
      ),
    );

  }
}
