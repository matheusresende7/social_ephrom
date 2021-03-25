import 'package:flutter/material.dart';

class TextPadrao extends StatelessWidget {

  final String text;
  final double fontSize;
  final Color color;

  TextPadrao ({
    this.text,
    this.fontSize = 27,
    this.color = const Color(0xff060056),
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text (
            this.text,
            style: TextStyle(
              fontSize: this.fontSize,
              fontWeight: FontWeight.bold,
              color: this.color,
              letterSpacing: 1,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );

  }
}
