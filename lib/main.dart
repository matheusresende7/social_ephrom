import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:social_ephrom/themes/PadraoTheme.dart';
import 'package:social_ephrom/views/configuracoes/Configuracoes.dart';
import 'package:social_ephrom/views/configuracoes/SobreoApp.dart';
import 'package:social_ephrom/views/inicio/SplashScreen.dart';
import 'package:social_ephrom/views/navegacao/InitialHome.dart';
import 'package:social_ephrom/views/navegacao/Perfil.dart';
import 'package:social_ephrom/views/navegacao/Publicacao.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
      home: SplashScreen (),
      title: 'Social Ephrom',
      debugShowCheckedModeBanner: false,
      theme: PadraoTheme().materialTheme,
      initialRoute: '/',
      getPages: [
        getPageRightToLeft(
          name: '/InitialHome',
          page: () => InitialHome(),
        ),
        getPageRightToLeft(
          name: '/Publicacao',
          page: () => Publicacao(),
        ),
        getPageRightToLeft(
          name: '/Perfil',
          page: () => Perfil(),
        ),
        getPageRightToLeft(
          name: '/Configuracoes',
          page: () => Configuracoes(),
        ),
        getPageRightToLeft(
          name: '/SobreoApp',
          page: () => SobreoApp(),
        ),
      ]
  ));
}

GetPage getPageRightToLeft ({
  String name,
  Widget Function() page,
}) {
  return GetPage(
    name: name,
    page: page,
    transition: Transition.rightToLeft,
    transitionDuration: Duration(milliseconds: 700),
  );
}