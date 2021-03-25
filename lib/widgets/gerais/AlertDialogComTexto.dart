import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertDialogComTexto extends StatelessWidget {

  final String text;
  final String content;
  final Color color;
  final IconData icon;
  final FutureOr <void> onPressed;

  AlertDialogComTexto ({
    this.text,
    this.content,
    this.color,
    this.icon,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {

    return AlertDialog(

      shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular(30)),

      backgroundColor: Theme.of(context).backgroundColor,

      actions: <Widget>[

        Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 25),
          child: Column (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Icon(
                this.icon,
                size: 120,
                color: this.color,
              ),

              Column (
                children: [

                  SizedBox (height: 40,),

                  Text (
                    this.text,
                    style: TextStyle (
                        color: this.color,
                        fontSize: 23,
                        fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox (height: 30,),

                  Text (
                    this.content,
                    style: TextStyle (
                      color: this.color,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  SizedBox (height: 30,),

                  Row (
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
                        child: Container(
                          height: 45,
                          width: 115,
                          child: FlatButton(
                            child: Text(
                              'Não'.tr,
                              style: TextStyle(
                                  color: this.color,
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            color: Theme.of(context).backgroundColor,
                            shape: RoundedRectangleBorder (
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(
                                  color: this.color,
                                  width: 1.5
                              ),
                            ),
                            onPressed: (){Get.back();},
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(4, 4, 0, 4),
                        child: Container(
                          height: 45,
                          width: 115,
                          child: FlatButton(
                            child: Text(
                              'Sim'.tr,
                              style: TextStyle(
                                  color: this.color,
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            color: Theme.of(context).backgroundColor,
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
                      ),

                    ],
                  )

                ],
              ),

            ],
          ),
        )

      ],

    );

  }
}
