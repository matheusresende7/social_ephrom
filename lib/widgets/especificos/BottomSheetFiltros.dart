import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ephrom/controllers/navegacao/HomeController.dart';
import 'package:social_ephrom/widgets/gerais/DividerPadrao.dart';
import 'package:social_ephrom/widgets/gerais/DropdownButtonFormFieldPadrao.dart';
import 'package:social_ephrom/widgets/gerais/FlatButtonOpcoesPadrao.dart';

class BottomSheetFiltros extends StatefulWidget {
  @override
  _BottomSheetFiltrosState createState() => _BottomSheetFiltrosState();
}

class _BottomSheetFiltrosState extends State<BottomSheetFiltros> {

  HomeController home = HomeController();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Container(
        height: 600,
        child: SingleChildScrollView(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Icon(
                      Icons.filter_list,
                      size: 32,
                      color: Theme.of(context).primaryColor,
                    ),

                    SizedBox(width: 15,),

                    Text (
                      'Filtros',
                      style: TextStyle (
                        color: Theme.of(context).primaryColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text (
                      'Classificar por',
                      style: TextStyle (
                        color: Theme.of(context).disabledColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              DropdownButtonFormFieldPadrao (
                value: home.classificacaoSelecionada,
                items: home.tiposClassificacao.map ((classificacaoSelecionada) {
                  return DropdownMenuItem (
                    value: classificacaoSelecionada,
                    child: Text ('$classificacaoSelecionada'),
                  );
                }).toList (),
                onChanged: (valor) {home.classificacaoOnChanged(valor);},
                text: 'Classificação',
                icon: Icons.filter_list,
              ),

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text (
                      'Ordenar por',
                      style: TextStyle (
                        color: Theme.of(context).disabledColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10,),

              Row (
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  FlatButtonOpcoesPadrao(
                    text: 'Crescente',
                    color: home.crescente ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
                    colorButton: home.crescente ? Theme.of(context).primaryColor : Theme.of(context).accentColor,
                    height: 50,
                    onPressed: () {
                      setState(() {
                        home.crescenteOnPressed();
                      });
                    },
                  ),

                  FlatButtonOpcoesPadrao(
                    text: 'Decrescente',
                    color: home.decrescente ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
                    colorButton: home.decrescente ? Theme.of(context).primaryColor : Theme.of(context).accentColor,
                    height: 50,
                    onPressed: () {
                      setState(() {
                        home.decrescenteOnPressed();
                      });
                    },
                  ),

                ],
              ),

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text (
                      'Características',
                      style: TextStyle (
                        color: Theme.of(context).disabledColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10,),

              Row (
                children: [

                  FlatButtonOpcoesPadrao(
                    text: 'Android',
                    color: home.androidL ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
                    colorButton: home.androidL ? Theme.of(context).primaryColor : Theme.of(context).accentColor,
                    width: 110,
                    height: 45,
                    onPressed: () {
                      setState(() {
                        home.androidMetodo();
                      });
                    },
                  ),

                  FlatButtonOpcoesPadrao(
                    text: 'iOS',
                    color: home.iosL ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
                    colorButton: home.iosL ? Theme.of(context).primaryColor : Theme.of(context).accentColor,
                    width: 70,
                    height: 45,
                    onPressed: () {
                      setState(() {
                        home.iosMetodo();
                      });
                    },
                  ),

                  FlatButtonOpcoesPadrao(
                    text: 'Web',
                    color: home.webL ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
                    colorButton: home.webL ? Theme.of(context).primaryColor : Theme.of(context).accentColor,
                    width: 80,
                    height: 45,
                    onPressed: () {
                      setState(() {
                        home.webMetodo();
                      });
                    },
                  ),

                ],
              ),

              Row (
                children: [

                  FlatButtonOpcoesPadrao(
                    text: 'Desktop',
                    color: home.desktopL ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
                    colorButton: home.desktopL ? Theme.of(context).primaryColor : Theme.of(context).accentColor,
                    width: 110,
                    height: 45,
                    onPressed: () {
                      setState(() {
                        home.desktopMetodo();
                      });
                    },
                  ),

                  FlatButtonOpcoesPadrao(
                    text: 'Front End',
                    color: home.frontEndL ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
                    colorButton: home.frontEndL ? Theme.of(context).primaryColor : Theme.of(context).accentColor,
                    width: 130,
                    height: 45,
                    onPressed: () {
                      setState(() {
                        home.frontEndMetodo();
                      });
                    },
                  ),

                ],
              ),

              Row(
                children: [

                  FlatButtonOpcoesPadrao(
                    text: 'Back End',
                    color: home.backEndL ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
                    colorButton: home.backEndL ? Theme.of(context).primaryColor : Theme.of(context).accentColor,
                    width: 130,
                    height: 45,
                    onPressed: () {
                      setState(() {
                        home.backEndMetodo();
                      });
                    },
                  ),

                  FlatButtonOpcoesPadrao(
                    text: 'Design',
                    color: home.designL ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
                    colorButton:home.designL ? Theme.of(context).primaryColor : Theme.of(context).accentColor,
                    width: 100,
                    height: 45,
                    onPressed: () {
                      setState(() {
                        home.designMetodo();
                      });
                    },
                  ),

                ],
              ),

              SizedBox(height: 30,),

              DividerPadrao(),

              SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  RaisedButton(
                    elevation: 4,
                    shape: RoundedRectangleBorder (
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                      child: Text (
                        'Cancelar',
                        style: TextStyle (
                          color: Theme.of(context).primaryColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onPressed: () {Get.back();},
                  ),

                  SizedBox(width: 15,),

                  RaisedButton(
                    elevation: 4,
                    shape: RoundedRectangleBorder (
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                      child: Text (
                        'Filtrar',
                        style: TextStyle (
                          color: Theme.of(context).accentColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onPressed: () {},
                  ),

                ],
              ),

              SizedBox(height: 40,),

            ],
          ),
        ),
      ),
    );

  }
}
