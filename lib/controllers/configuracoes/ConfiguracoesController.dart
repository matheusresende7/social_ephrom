import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:social_ephrom/themes/DarkTheme.dart';
import 'package:social_ephrom/themes/PadraoTheme.dart';
import 'package:social_ephrom/views/navegacao/InitialHome.dart';

class ConfiguracoesController extends GetxController {


  LocalAuthentication localAuthentication = LocalAuthentication();
  FlutterLocalNotificationsPlugin localNotifications = FlutterLocalNotificationsPlugin();


  @override
  void onInit() {
    super.onInit();
    biometriaEstadoInicial();
    themeEstadoInicial();
    notificacoesEstadoInicial();
    inicializacaoNotificacoes();
  }



  //**************************SWITCH BIOMETRIA*******************************

  //para funcionar corretamente deixar o arquivo android/app/src/main/java/'arquivo do projeto'/MainActivity

  Future<bool> biometriaDisponivel() async {
    bool biometriaEstaDisponivel = await localAuthentication.canCheckBiometrics;
    return biometriaEstaDisponivel;
  }

  Future<void> obterListaBiometria() async {
    List<BiometricType> listaDeBiometrias = await localAuthentication.getAvailableBiometrics();
  }

  Future<void> autenticarUsuario() async {
    bool estaAutenticado = await localAuthentication.authenticateWithBiometrics(
      localizedReason: 'Toque no sensor de impressão digital',
      useErrorDialogs: true,
      stickyAuth: false,
      sensitiveTransaction: true,
      androidAuthStrings: AndroidAuthMessages(
          signInTitle: 'Autenticação biométrica',
          fingerprintHint: '',
          cancelButton: 'Cancelar',
      )
    );

    if (estaAutenticado) {
      Get.offAll(
        InitialHome(),
        transition: Transition.zoom,
        duration: Duration(milliseconds: 1500),
      );
    }

  }

  autenticarBiometria() async {
    if (await biometriaDisponivel()) {
      await obterListaBiometria();
      await autenticarUsuario();
    }
  }

  bool biometriaAtivado = false;

  void biometriaDesativar () {
    biometriaAtivado = false;
    GetStorage().write('biometriaMemoria', 'Desativada');
  }

  void biometriaAtivar () {
    biometriaAtivado = true;
    GetStorage().write('biometriaMemoria', 'Ativada');
  }

  void ativarBiometria () {
    biometriaAtivado ? biometriaDesativar() : biometriaAtivar();
    update();
  }

  void biometriaMemoriaUpdate() {
    if (GetStorage().read('biometriaMemoria') == 'Ativada') {
      autenticarBiometria();
    }
    else {
      Get.offAll(
        InitialHome(),
        transition: Transition.zoom,
        duration: Duration(milliseconds: 1500),
      );
    }
  }

  void biometriaEstadoInicial() {
    if (GetStorage().read('biometriaMemoria') == 'Ativada') {
      biometriaAtivado = true;
    }
    else if (GetStorage().read('biometriaMemoria') == 'Desativada') {
      biometriaAtivado = false;
    }
  }

  String snackBarBiometriaMsg () {
    return biometriaAtivado ? 'Biometria ativada.' : 'Biometria desativada.';
  }



  //**************************SWITCH MODO NOTURNO*******************************
  bool darkModeAtivado = false;

  void changePadraoTheme () {
    Get.changeTheme(PadraoTheme().materialTheme);
    darkModeAtivado = false;
    GetStorage().write('themeMemoria', 'Padrao');
  }

  void changeDarkTheme () {
    Get.changeTheme(DarkTheme().materialTheme);
    darkModeAtivado = true;
    GetStorage().write('themeMemoria', 'Dark');
  }

  void ativarDarkMode () {
    darkModeAtivado ? changePadraoTheme() : changeDarkTheme();
  }

  void themeMemoriaUpdate() {
    if (GetStorage().read('themeMemoria') == 'Padrao') {
      Get.changeTheme(PadraoTheme().materialTheme);
    }
    else if (GetStorage().read('themeMemoria') == 'Dark') {
      Get.changeTheme(DarkTheme().materialTheme);
    }
  }

  void themeEstadoInicial() {
    if (GetStorage().read('themeMemoria') == 'Padrao') {
      darkModeAtivado = false;
    }
    else if (GetStorage().read('themeMemoria') == 'Dark') {
      darkModeAtivado = true;
    }
  }

  String snackBarDarkModeMsg () {
    return darkModeAtivado ? 'Modo escuro ativado.' : 'Modo escuro desativado.';
  }



  //**************************SWITCH NOTIFICAÇOES*******************************

  Future <void> inicializacaoNotificacoes () async {
    var androidInitialize = AndroidInitializationSettings('ic_launcher');
    var initializationSettings = InitializationSettings(android: androidInitialize);
    localNotifications = FlutterLocalNotificationsPlugin();
    localNotifications.initialize(initializationSettings);
  }

  Future <void> mostrarNotificacoes () async {
    var androidDetails = AndroidNotificationDetails(
      'channel id', 'channel name', 'channel description',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      enableVibration: true,
    );
    var platformChannelSpecifics = NotificationDetails(android: androidDetails);
    await localNotifications.schedule(
        0,
        'Social Ephrom',
        'Entre para acompanhar nossas novidades',
        DateTime.now().add(Duration(minutes: 3)),
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
    );
  }

  bool notificacoesAtivadas = false;

  void notificacoesDesativar () {
    notificacoesAtivadas = false;
    GetStorage().write('notificacoesMemoria', 'Desativadas');
  }

  void notificacoesAtivar () {
    notificacoesAtivadas = true;
    GetStorage().write('notificacoesMemoria', 'Ativadas');
  }

  void ativarNotificacoes () {
    notificacoesAtivadas ? notificacoesDesativar() : notificacoesAtivar();
    update();
  }

  void notificacoesMemoriaUpdate() {
    if (GetStorage().read('notificacoesMemoria') == 'Ativadas') {
      mostrarNotificacoes();
    }
    else {

    }
  }

  void notificacoesEstadoInicial() {
    if (GetStorage().read('notificacoesMemoria') == 'Ativadas') {
      notificacoesAtivadas = true;
    }
    else if (GetStorage().read('notificacoesMemoria') == 'Desativadas') {
      notificacoesAtivadas = false;
    }
  }

  String snackBarNotificacoesMsg () {
    return notificacoesAtivadas ? 'Notificações ativadas.' : 'Notificações desativadas.';
  }



  //**************************APAGAR CONTA**************************************

  void apagarContaOnTap () {
    GetStorage().write('jaEntrouNoApp', 'Não');
    GetStorage().write('biometriaMemoria', 'Desativada');
    GetStorage().write('themeMemoria', 'Padrao');
    GetStorage().write('notificacoesMemoria', 'Desativadas');
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }




}