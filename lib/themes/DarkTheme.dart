import 'package:flutter/material.dart';

class DarkTheme {

  ThemeData get materialTheme {
    return ThemeData(
      primaryColor: Colors.grey[600],
      textSelectionColor: Colors.grey[600],
      hoverColor: Color(0xfff49434), //deve ser a primaryColor do PadraoTheme
      primaryColorDark: Colors.grey[800],
      primaryColorLight: Colors.grey[600],
      accentColor: Colors.white,
      backgroundColor: Colors.grey[900],
      disabledColor: Colors.grey[400],
      indicatorColor: Colors.green,
      errorColor: Colors.red,
    );
  }

}