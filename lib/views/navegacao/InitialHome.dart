import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ephrom/controllers/navegacao/InitialHomeController.dart';

class InitialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GetBuilder<InitialHomeController>(
        init: InitialHomeController(),
        builder: (_) {

          return Scaffold(

            extendBody: true,

            body: _.telas[_.indiceAtual],

            bottomNavigationBar: CurvedNavigationBar(
              height: 55,
              color: Theme.of(context).primaryColor,
              backgroundColor: Colors.transparent,//Theme.of(context).accentColor,
              buttonBackgroundColor: Theme.of(context).primaryColor,
              items: [
                Icon(Icons.home, size: 30, color: Theme.of(context).accentColor,),
                Icon(Icons.add, size: 30, color: Theme.of(context).accentColor,),
                Icon(Icons.person, size: 30, color: Theme.of(context).accentColor,),
              ],
              key: _.bottomNavigationKey,
              onTap: (index) {_.indexPages(index);},
            ),

          );
        }
    );

  }
}
