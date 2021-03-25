import 'package:flutter/material.dart';

class TextPadraoSemPadding extends StatelessWidget {

  final String text;
  final double fontSize;

  TextPadraoSemPadding ({
    this.text,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {

    return Text (
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
    );

  }
}
