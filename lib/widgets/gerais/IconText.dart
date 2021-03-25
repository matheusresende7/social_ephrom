import 'package:flutter/material.dart';

class IconText extends StatelessWidget {

  final String text;
  final IconData icon;
  final Color color;

  IconText ({
    this.text,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [

        Icon(
          this.icon,
          size: 20,
          color: this.color,
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
