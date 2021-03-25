import 'dart:async';
import 'package:flutter/material.dart';

class RaisedButtonPadrao extends StatelessWidget {

  final String text;
  final IconData icon;
  final Color colorText;
  final Color colorButton;
  final FutureOr <void> onPressed;

  RaisedButtonPadrao ({
    this.text,
    this.icon,
    this.colorText,
    this.colorButton,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 55,
          child: RaisedButton(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row (
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Icon(
                    this.icon,
                    size: 35,
                    color: this.colorText,
                  ),

                  //SizedBox (width: 30,),

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          this.text,
                          style: TextStyle(
                              color: this.colorText,
                              fontSize: 23,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            elevation: 8,
            color: this.colorButton,
            disabledColor: Theme.of(context).disabledColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            onPressed: this.onPressed,
          ),
        ),
      ],
    );

  }
}
