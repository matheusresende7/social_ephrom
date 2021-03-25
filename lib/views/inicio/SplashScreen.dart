import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ephrom/controllers/inicio/SplashScreenController.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
        init: SplashScreenController(),
        builder: (_) {

          _.portraitMode();
          return Scaffold(

            extendBodyBehindAppBar: true,

            backgroundColor: Colors.white,

            body: Center(
              child: DelayedDisplay(
                delay: Duration(milliseconds: 500),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      height: 90,
                      width: 90,
                      child: Card (
                        elevation: 6,
                        shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular(25)),
                        color: Colors.white,
                        child: Align(
                          alignment: Alignment(0, -0.5),
                          child: Text (
                            'o',
                            style: TextStyle(
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox (width: 20,),

                    Text (
                      'Social Ephrom',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color(0xfff49434),
                        letterSpacing: 2,
                      ),
                      textAlign: TextAlign.start,
                    ),

                  ],
                ),
              ),
            ),

          );

        }
    );

  }
}
