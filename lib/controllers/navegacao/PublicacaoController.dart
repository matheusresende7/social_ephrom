import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class PublicacaoController extends GetxController {



  //***************************CHAVE FORMULARIO********************************
  final formKey = GlobalKey<FormState> ();



  //*******************************CONTROLLERS**********************************
  TextEditingController controllerPublicacao = TextEditingController();



  //*******************************VALIDATORS***********************************
  String publicacaoValidator(valor) {
    if (valor.isEmpty) {
      return 'Esse é um campo obrigatório.';
    }
    if (valor.length > 280) {
      return 'Seu post deve ter 280 caracteres.';
    }
    return null;
  }

  String plataformaValidator(valor) {
    if (valor.isEmpty) {
      return 'Esse é um campo obrigatório.';
    }
    return null;
  }

  String areaValidator(valor) {
    if (valor.isEmpty) {
      return 'Esse é um campo obrigatório.';
    }
    return null;
  }



  //*******************************DROPDOWN PLATAFORMA**************************
  String plataformaSelecionada;

  List <String> plataformas = [
    'Android',
    'iOS',
    'Web',
    'Desktop',
    'Nenhuma',
  ];

  void plataformaOnChanged (valor) {
    plataformaSelecionada = valor;
    update();
  }



  //*******************************DROPDOWN AREA********************************
  String areaSelecionada;

  List <String> areas = [
    'Front End',
    'Back End',
    'Design',
    'Nenhuma',
  ];

  void areaOnChanged (valor) {
    areaSelecionada = valor;
    update();
  }



}