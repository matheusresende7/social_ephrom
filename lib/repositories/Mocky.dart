import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:social_ephrom/shared/APIs.dart';

class Mocky extends GetxController  {

  APIs apis = APIs();



  //*******************************API POSTAGENS********************************
  Future <Map> obterPostagensAPI () async {

    http.Response response = await http.get(apis.apiPostagens);

    return json.decode(response.body);

  }



  //**************************REFRESH INDICATOR*********************************
  Future <void> refreshMetodo () async {
    await obterPostagensAPI();
    update();
  }



}