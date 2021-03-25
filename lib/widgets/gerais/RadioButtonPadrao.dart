import 'dart:async';
import 'package:flutter/material.dart';

class RadioButtonPadrao extends StatelessWidget {

  final String text;
  final IconData icon;
  final Color color;
  final dynamic value;
  final dynamic groupValue;
  final FutureOr <void> onChanged;

  RadioButtonPadrao ({
    this.text,
    this.icon,
    this.color,
    this.value,
    this.groupValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return RadioListTile(
      title: Text(
        this.text,
        style: TextStyle(
          color: this.color,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      secondary: Icon(
        this.icon,
        size: 30,
        color: this.color,
      ),
      activeColor: this.color,
      controlAffinity: ListTileControlAffinity.trailing,
      value: this.value,
      groupValue: this.groupValue,
      onChanged: this.onChanged,
    );

  }
}
