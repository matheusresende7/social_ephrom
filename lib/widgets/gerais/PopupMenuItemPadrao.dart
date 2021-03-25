import 'package:flutter/material.dart';

PopupMenuEntry PopupMenuItemPadrao ({
  double value,
  String text,
  IconData icon,
}) {
  return PopupMenuItem (
    value: value,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Icon(
          icon,
          size: 22,
          color: Color(0xfff49434),
        ),

        SizedBox(width: 15,),

        Text (
          text,
          style: TextStyle (
            color: Color(0xfff49434),
            fontSize: 18,
          ),
        ),

      ],
    ),
  );
}
