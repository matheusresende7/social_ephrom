import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:social_ephrom/widgets/gerais/AlertDialogEntendi.dart';
import 'package:social_ephrom/widgets/gerais/AlertDialogSimNao.dart';
import 'package:social_ephrom/widgets/gerais/DividerPadrao.dart';
import 'package:url_launcher/url_launcher.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Theme.of(context).backgroundColor,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox (height: 40,),

              Container(
                height: 100,
                width: 100,
                child: Card (
                  elevation: 4,
                  shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular(25)),
                  color: Theme.of(context).accentColor,
                  child: Align(
                    alignment: Alignment(0, -0.5),
                    child: Text (
                      'o',
                      style: TextStyle(
                        fontSize: 65,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox (height: 10,),

              Text (
                'Social\nEphrom',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox (height: 20,),

              listTilePerfil(
                text: 'Configurações',
                icon: Icons.settings_applications,
                onTap: () {Get.toNamed('/Configuracoes');},
              ),

              DividerPadrao(),

              listTilePerfil(
                text: 'Website',
                icon: Icons.laptop,
                onTap: () {
                  Get.dialog(
                      AlertDialogEntendi (
                        text: 'Quer saber mais informações?\nConfira nosso site.',
                        color: Theme.of(context).primaryColor,
                        icon: Icons.laptop,
                        onPressed: () async {
                          await launch('http://www.ephrom.com.br/');
                          Get.back();
                        },
                      )
                  );
                },
              ),

              DividerPadrao(),

              listTilePerfil(
                text: 'Sobre o app',
                icon: Icons.phone_android,
                onTap: () {Get.toNamed('/SobreoApp');},
              ),

              DividerPadrao(),

              listTilePerfil(
                text: 'Avalie o app',
                icon: Icons.thumb_up,
                onTap: () {
                  Get.dialog(
                      AlertDialogEntendi (
                        text: 'Avalie nosso app!\nNos conte sua opinião para que possamos '
                            'atender suas necessidades. Sugestões e críticas são muito bem-vindas.',
                        color: Theme.of(context).primaryColor,
                        icon: Icons.thumb_up,
                        onPressed: () async {
                          await launch('http://www.ephrom.com.br/');
                          Get.back();
                        },
                      )
                  );
                },
              ),

              DividerPadrao(),

              listTilePerfil(
                text: 'Sair',
                icon: Icons.exit_to_app,
                onTap: () {
                  Get.dialog(
                      AlertDialogSimNao (
                        text: 'Tem certeza que deseja sair?',
                        color: Theme.of(context).primaryColor,
                        icon: Icons.exit_to_app,
                        onPressed: () {
                          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                        },
                      )
                  );
                },
              ),

              SizedBox (height: 70,),

            ],
          ),
        ),
      ),

    );

  }

  Widget listTilePerfil ({
    IconData icon,
    String text,
    FutureOr <void> onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Text(
            text,
            style: TextStyle(
                color: Theme.of(context).textSelectionColor,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        leading: Icon(
          icon,
          size: 35,
          color: Theme.of(context).primaryColor,
        ),
        onTap: onTap,
      ),
    );
  }

}
