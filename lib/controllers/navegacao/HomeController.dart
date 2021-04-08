import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:social_ephrom/controllers/configuracoes/ConfiguracoesController.dart';

class HomeController extends GetxController {


  ConfiguracoesController configuracoes = ConfiguracoesController();



  //*******************************SLIVER APP BAR*******************************
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();



  //*******************************CONTROLLERS**********************************
  TextEditingController controllerPesquisa = TextEditingController();



  //*******************************BARRA DE PESQUISA****************************
  double apagarEBarraVisiveis = 0;
  bool apagarEBarraVisiveisBool = false;

  void opacityItens () {
    if (controllerPesquisa.text != '') {
      apagarEBarraVisiveis = 1;
      apagarEBarraVisiveisBool = true;
      update();
    }
    else {
      apagarEBarraVisiveis = 0;
      apagarEBarraVisiveisBool = false;
      update();
    }
  }

  void apagarPesquisa () {
    controllerPesquisa.text = '';
  }



  //*******************************FAB SCROLL TO TOP****************************
  ScrollController scrollController = ScrollController();

  void scrollToTopMetodo () {
    scrollController.animateTo(
        scrollController.position.minScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn
    );
  }



  //*******************************DROPDOWN CLASSIFICAR POR*********************
  String classificacaoSelecionada;

  List <String> tiposClassificacao = [
    'Curtidas',
    'Comentários',
    'Compartilhamentos',
  ];

  void classificacaoOnChanged (valor) {
    classificacaoSelecionada = valor;
    update();
  }



  //***********************ORDENAR POR CRESCENTE E DECRESCENTE******************
  bool crescente = true;
  bool decrescente = false;

  //CRESCENTE

  void crescenteOnPressed () {
    switch (crescente) {
      case false:
        crescente = !crescente;
        if (decrescente = true) {
          decrescente = !decrescente;
        }
        break;
    }
    update();
  }

  //DECRESCENTE

  void decrescenteOnPressed () {
    switch (decrescente) {
      case false:
        decrescente = !decrescente;
        if (crescente = true) {
          crescente = !crescente;
        }
        break;
    }
    update();
  }



  //***********************CARACTERISTICAS LABELS BUTTONS***********************
  bool androidL = false;
  bool iosL = false;
  bool webL = false;
  bool desktopL = false;
  bool frontEndL = false;
  bool backEndL = false;
  bool designL = false;

  void androidMetodo () {
    androidL = !androidL;
  }

  void iosMetodo () {
    iosL = !iosL;
  }

  void webMetodo () {
    webL = !webL;
  }

  void desktopMetodo () {
    desktopL = !desktopL;
  }

  void frontEndMetodo () {
    frontEndL = !frontEndL;
  }

  void backEndMetodo () {
    backEndL = !backEndL;
  }

  void designMetodo () {
    designL = !designL;
  }



  //************************CURTIR, COMENTAR, COMPARTILHAR**********************
  bool curtidasVisivel = false;
  bool comentariosVisivel = false;
  bool compatilhamentosVisivel = false;

  void curtir () {
    curtidasVisivel = !curtidasVisivel;
  }

  void comentar () {
    comentariosVisivel = !comentariosVisivel;
  }

  void compartilhar () {
    compatilhamentosVisivel = !compatilhamentosVisivel;
  }



}
