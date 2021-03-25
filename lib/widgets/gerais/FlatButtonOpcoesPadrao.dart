import 'dart:async';

import 'package:flutter/material.dart';

class FlatButtonOpcoesPadrao extends StatelessWidget {

  final String text;
  final Color color;
  final Color colorButton;
  final double height;
  final double width;
  final FutureOr <void> onPressed;

  FlatButtonOpcoesPadrao ({
    this.text,
    this.color,
    this.colorButton,
    this.height = 60,
    this.width = 160,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 0, 4),
      child: Container(
        height: this.height,
        width: this.width,
        child: FlatButton(
          child: Text(
            this.text,
            style: TextStyle(
                color: this.color,
                fontSize: 21,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          color: this.colorButton,
          shape: RoundedRectangleBorder (
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(
                color: this.color,
                width: 1.5
            ),
          ),
          onPressed: this.onPressed,
        ),
      ),
    );

  }
}
