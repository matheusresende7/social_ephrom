import 'package:flutter/material.dart';
import 'dart:math' as math;

class IconTextInvert extends StatelessWidget {

  final String text;
  final IconData icon;
  final Color color;

  IconTextInvert ({
    this.text,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [

        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: Icon(
            this.icon,
            size: 20,
            color: this.color,
          ),
        ),

        SizedBox(width: 5,),

        Text (
          this.text,
          style: TextStyle (
            color: this.color,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),

      ],
    );

  }
}
