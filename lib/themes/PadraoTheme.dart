import 'package:flutter/material.dart';

class PadraoTheme {

  ThemeData get materialTheme {
    return ThemeData(
      primaryColor: Color(0xfff49434),
      textSelectionColor: Colors.grey[600],
      hoverColor: Colors.grey[600], //deve ser a primaryColor do DarkTheme
      primaryColorDark: Colors.deepOrange,
      primaryColorLight: Colors.orangeAccent,
      accentColor: Colors.white,
      backgroundColor: Colors.white,
      disabledColor: Colors.grey[400],
      indicatorColor: Colors.green,
      errorColor: Colors.red,
    );
  }

}