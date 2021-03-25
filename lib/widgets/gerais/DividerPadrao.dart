import 'package:flutter/material.dart';

class DividerPadrao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Theme.of(context).disabledColor,
      width: MediaQuery.of(context).size.width * 0.8,
      height: 0.5,
    );

  }
}
