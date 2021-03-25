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



  //************************RECEBENDO DADOS*************************************
  String nome1 = 'Beatriz Barbosa';
  String dataHorario1 = '05/16/16 - 15:32';//'1616502241000',
  String imagem1 = 'https://randomuser.me/api/portraits/women/1.jpg';
  String plataforma1 = 'Android';
  String area1 = 'Front End';
  String texto1 = 'It was popularised in the 1960s with the release of Letraset'
  ' sheets containing Lorem Ipsum passages, and more recently'
  ' with desktop publishing software like Aldus PageMaker'
  ' including versions of Lorem Ipsum.';
  String curtidas1 = '8';
  String comentarios1 = '1';
  String compartilhamentos1 = '4';

  String nome2 = 'Rodrigo Azevedo';
  String dataHorario2 = '05/16/16 - 15:32';//'1616502241000',
  String imagem2 = 'https://randomuser.me/api/portraits/men/73.jpg';
  String plataforma2 = 'iOS';
  String area2 = 'Back End';
  String texto2 = 'It is a long established fact that a reader will be'
      ' distracted by the readable content of a page when looking'
      ' at its layout.';
  String curtidas2 = '2';
  String comentarios2 = '1';
  String compartilhamentos2 = '3';

  String nome3 = 'Bianca Costa';
  String dataHorario3 = '05/16/16 - 15:32';//'1616502241000',
  String imagem3 = 'https://randomuser.me/api/portraits/women/3.jpg';
  String plataforma3 = 'Web';
  String area3 = 'Design';
  String texto3 = 'Contrary to popular belief, Lorem Ipsum is not simply'
      ' random text. It has roots in a piece of classical Latin'
      ' literature from 45 BC, making it over 2000 years old.';
  String curtidas3 = '12';
  String comentarios3 = '5';
  String compartilhamentos3 = '7';

  String nome4 = 'Júlio Pereira';
  String dataHorario4 = '05/16/16 - 15:32';//'1616502241000',
  String imagem4 = 'https://randomuser.me/api/portraits/men/77.jpg';
  String plataforma4 = 'Desktop';
  String area4 = 'Back End';
  String texto4 = 'There are many variations of passages of Lorem Ipsum available,'
      ' but the majority have suffered alteration in some form, '
      'by injected humour, or randomised words which don\'t look '
      'even slightly believable.';
  String curtidas4 = '22';
  String comentarios4 = '11';
  String compartilhamentos4 = '16';

  String nome5 = 'Victor Cunha';
  String dataHorario5 = '05/16/16 - 15:32';//'1616502241000',
  String imagem5 = 'https://randomuser.me/api/portraits/men/17.jpg';
  String plataforma5 = 'iOS';
  String area5 = 'Design';
  String texto5 = 'All the Lorem Ipsum generators on the Internet tend to'
      ' repeat predefined chunks as necessary, making this the'
      ' first true generator on the Internet.';
  String curtidas5 = '6';
  String comentarios5 = '2';
  String compartilhamentos5 = '1';

  String nome6 = 'Pedro Cardoso';
  String dataHorario6 = '05/16/16 - 15:32';//'1616502241000',
  String imagem6 = 'https://randomuser.me/api/portraits/men/10.jpg';
  String plataforma6 = 'Web';
  String area6 = 'Front End';
  String texto6 = 'Lorem Ipsum is simply dummy text of the printing and'
      ' typesetting industry. Lorem Ipsum has been the industry\'s'
      ' standard dummy text ever since the 1500s, when an unknown'
      ' printer took a galley of type and scrambled it to make a'
      ' type specimen book. It has survived not only five centuries,'
      ' but also the leap into electronic typesetting, remaining'
      ' essentially unchanged.';
  String curtidas6 = '11';
  String comentarios6 = '3';
  String compartilhamentos6 = '7';



}
