import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:social_ephrom/controllers/navegacao/PublicacaoController.dart';
import 'package:social_ephrom/widgets/gerais/DropdownButtonFormFieldPadrao.dart';
import 'package:social_ephrom/widgets/gerais/RaisedButtonPadrao.dart';
import 'package:social_ephrom/widgets/gerais/TextFormFieldPadrao.dart';
import 'package:social_ephrom/widgets/gerais/TextPadrao.dart';

class Publicacao extends StatefulWidget {
  @override
  _PublicacaoState createState() => _PublicacaoState();
}

class _PublicacaoState extends State<Publicacao> {
  @override
  Widget build(BuildContext context) {

    return GetBuilder<PublicacaoController>(
        init: PublicacaoController(),
        builder: (_) {

          return Scaffold(

            extendBodyBehindAppBar: true,

            backgroundColor: Theme.of(context).backgroundColor,

            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox (height: 50,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Container(
                          height: 80,
                          width: 80,
                          child: Card (
                            elevation: 4,
                            shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular(25)),
                            color: Theme.of(context).accentColor,
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Icon(
                                Icons.assignment,
                                size: 50,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),

                        Text (
                          'Publicação',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                            letterSpacing: 3,
                            height: 1.25,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox (width: 10,),

                      ],
                    ),

                    SizedBox (height: 50,),

                    Form (
                      key: _.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          TextPadrao(
                            text: 'Compartilhe suas ideias:',
                            fontSize: 21,
                            color: Theme.of(context).textSelectionColor,
                          ),

                          TextFormFieldPadrao (
                            controller: _.controllerPublicacao,
                            text: 'Faça sua publicação...',
                            color: Theme.of(context).textSelectionColor,
                            keybordType: TextInputType.multiline,
                            border: InputBorder.none,
                            maxLength: 280,
                            validator: _.publicacaoValidator,
                          ),

                          SizedBox (height: 50,),

                          TextPadrao(
                            text: 'Selecione a plataforma:',
                            fontSize: 21,
                            color: Theme.of(context).textSelectionColor,
                          ),

                          DropdownButtonFormFieldPadrao (
                            value: _.plataformaSelecionada,
                            items: _.plataformas.map ((plataformaSelecionado) {
                              return DropdownMenuItem (
                                value: plataformaSelecionado,
                                child: Text ('$plataformaSelecionado'),
                              );
                            }).toList (),
                            onChanged: (valor) {_.plataformaOnChanged(valor);},
                            text: 'Plataforma',
                            validator: _.plataformaValidator,
                          ),

                          SizedBox (height: 50,),

                          TextPadrao(
                            text: 'Selecione a área:',
                            fontSize: 21,
                            color: Theme.of(context).textSelectionColor,
                          ),

                          DropdownButtonFormFieldPadrao (
                            value: _.areaSelecionada,
                            items: _.areas.map ((areaSelecionado) {
                              return DropdownMenuItem (
                                value: areaSelecionado,
                                child: Text ('$areaSelecionado'),
                              );
                            }).toList (),
                            onChanged: (valor) {_.areaOnChanged(valor);},
                            text: 'Área',
                            validator: _.areaValidator,
                          ),

                        ],
                      ),
                    ),

                    SizedBox (height: 70,),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                      child: RaisedButtonPadrao (
                          text: 'PUBLICAR',
                          icon: Icons.add,
                          colorText: Theme.of(context).accentColor,
                          colorButton: Theme.of(context).primaryColor,
                          onPressed: () {
                            if (_.formKey.currentState.validate()) {
                              Get.toNamed('/SobreoApp');
                            }
                          }
                      ),
                    ),

                    SizedBox (height: 100,),

                  ],
                ),
              ),
            ),

          );

        }
    );

  }

}
