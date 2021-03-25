import 'package:flutter/material.dart';
import 'package:get/get.dart';

void SnackBarPadrao ({
  String text,
  String message,
  IconData icon,
  Color backgroundColor,
}) {
  Get.snackbar(
    messageText: Text (
      message,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorText: Colors.white,
    icon: Icon(
      icon,
      color: Colors.white,
      size: 30,
    ),
    shouldIconPulse: false,
    backgroundColor: backgroundColor,
    snackPosition: SnackPosition.BOTTOM,
    margin: EdgeInsets.all(15),
    padding: EdgeInsets.fromLTRB(25, 17, 5, 17),
    borderRadius: 20,
    duration: Duration(seconds: 3),
  );
}