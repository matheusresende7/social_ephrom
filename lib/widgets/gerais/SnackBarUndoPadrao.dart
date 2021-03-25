import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void SnackBarUndoPadrao ({
  String text,
  String message,
  IconData icon,
  Color backgroundColor,
  FutureOr <void> onPressed,
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
    mainButton: TextButton(
      child: Text (
        'Desfazer',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: onPressed,
    ),
    shouldIconPulse: false,
    backgroundColor: backgroundColor,
    snackPosition: SnackPosition.BOTTOM,
    margin: EdgeInsets.fromLTRB(15, 15, 15, 75),
    padding: EdgeInsets.fromLTRB(25, 17, 5, 17),
    borderRadius: 20,
    duration: Duration(seconds: 4),
  );
}