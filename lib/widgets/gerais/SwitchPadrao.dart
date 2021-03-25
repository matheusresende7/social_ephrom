import 'dart:async';
import 'package:flutter/material.dart';

class SwitchPadrao extends StatelessWidget {

  final String text;
  final IconData icon;
  final Color color;
  final bool value;
  final FutureOr <void> onChanged;

  SwitchPadrao ({
    this.text,
    this.icon,
    this.color,
    this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return SwitchListTile(
        title: Text(
          this.text,
          style: TextStyle(
            color: this.color,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        secondary: Icon(
            this.icon,
          size: 30,
          color: Theme.of(context).primaryColor,
        ),
        activeColor: Theme.of(context).primaryColor,
        value: this.value,
        onChanged: this.onChanged,
    );

  }
}
