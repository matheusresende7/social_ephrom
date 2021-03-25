import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:social_ephrom/views/navegacao/Home.dart';
import 'package:social_ephrom/views/navegacao/Perfil.dart';
import 'package:social_ephrom/views/navegacao/Publicacao.dart';

class InitialHomeController extends GetxController {

  //**************************NAVEGACAO DAS PAGES*******************************
  int indiceAtual = 0;

  final List<Widget> telas = [
    Home(),
    Publicacao(),
    Perfil(),
  ];

  GlobalKey bottomNavigationKey = GlobalKey();

  void indexPages (index) {
    indiceAtual = index;
    update();
  }

}