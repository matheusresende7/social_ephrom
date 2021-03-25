import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:async';
import 'package:social_ephrom/controllers/configuracoes/ConfiguracoesController.dart';
import 'package:social_ephrom/views/inicio/IntroScreen.dart';

class SplashScreenController extends GetxController {


  ConfiguracoesController configuracoes = ConfiguracoesController();


  @override
  void onInit() {
    super.onInit();
    configuracoes.themeMemoriaUpdate();
    configuracoes.notificacoesMemoriaUpdate();
  }


  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 4), () {
      checkEntradaApp();
      jaEntrouNoApp();
    });
  }


  //*******************DELAY E IR PARA HOME OU INTRO SCREEN*********************
  //*******************Ao renderizar totalmente a tela**************************

  void checkEntradaApp()  {
    if (GetStorage().read('jaEntrouNoApp') == 'Sim') {
      configuracoes.biometriaMemoriaUpdate();
    }
    else {
      Get.offAll(
        IntroScreen(),
        transition: Transition.zoom,
        duration: Duration(milliseconds: 1500),
      );
    }
  }

  void jaEntrouNoApp () {
    GetStorage().write('jaEntrouNoApp', 'Sim');
  }



  //*******************MODO PORTRAIT********************************************
  void portraitMode() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
  }



}