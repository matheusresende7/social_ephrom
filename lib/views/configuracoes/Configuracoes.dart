import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_ephrom/controllers/configuracoes/ConfiguracoesController.dart';
import 'package:social_ephrom/widgets/gerais/AlertDialogSimNao.dart';
import 'package:social_ephrom/widgets/gerais/DividerPadrao.dart';
import 'package:social_ephrom/widgets/gerais/SnackBarPadrao.dart';
import 'package:social_ephrom/widgets/gerais/SwitchPadrao.dart';
import 'package:social_ephrom/widgets/gerais/TextPadrao.dart';

class Configuracoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GetBuilder<ConfiguracoesController>(
        init: ConfiguracoesController(),
        builder: (_) {

          return Scaffold(

            backgroundColor: Theme.of(context).backgroundColor,

            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox (height: 50,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                Icons.settings_applications,
                                size: 57,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),

                        Text (
                          'Configurações'.tr,
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

                    SizedBox (height: 30,),

                    TextPadrao(
                      text: 'Segurança'.tr,
                      fontSize: 18,
                      color: Theme.of(context).disabledColor,
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                          child: SwitchPadrao(
                            text: 'Biometria'.tr,
                            icon: Icons.fingerprint,
                            color: Theme.of(context).textSelectionColor,
                            value: _.biometriaAtivado,
                            onChanged: (valor) {
                              _.ativarBiometria();
                              SnackBarPadrao(
                                message: _.snackBarBiometriaMsg(),
                                icon: Icons.fingerprint,
                                backgroundColor: Theme.of(context).primaryColor,
                              );
                            },
                          ),
                        ),

                      ],
                    ),

                    SizedBox(height: 20,),

                    TextPadrao(
                      text: 'Preferências'.tr,
                      fontSize: 18,
                      color: Theme.of(context).disabledColor,
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                          child: SwitchPadrao(
                            text: 'Modo noturno'.tr,
                            icon: Icons.nights_stay,
                            color: Theme.of(context).textSelectionColor,
                            value: _.darkModeAtivado,
                            onChanged: (valor) {
                              _.ativarDarkMode();
                              SnackBarPadrao(
                                message: _.snackBarDarkModeMsg(),
                                icon: Icons.nights_stay,
                                backgroundColor: Theme.of(context).hoverColor,
                              );
                            },
                          ),
                        ),

                        DividerPadrao(),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                          child: SwitchPadrao(
                            text: 'Notificações'.tr,
                            icon: Icons.notifications_active,
                            color: Theme.of(context).textSelectionColor,
                            value: _.notificacoesAtivadas,
                            onChanged: (valor) {
                              _.ativarNotificacoes();
                              SnackBarPadrao(
                                message: _.snackBarNotificacoesMsg(),
                                icon: Icons.notifications_active,
                                backgroundColor: Theme.of(context).primaryColor,
                              );
                            },
                          ),
                        ),

                      ],
                    ),

                    SizedBox (height: 30,),

                    TextPadrao(
                      text: 'Conta'.tr,
                      fontSize: 18,
                      color: Theme.of(context).disabledColor,
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                          child: ListTile(
                            title: Text(
                              'Apagar conta'.tr,
                              style: TextStyle(
                                color: Theme.of(context).errorColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Icon(
                              Icons.delete,
                              size: 30,
                              color: Theme.of(context).errorColor,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                              color: Theme.of(context).errorColor,
                            ),
                            onTap: () {
                              Get.dialog(
                                  AlertDialogSimNao (
                                    text: 'Deseja apagar sua conta?'.tr,
                                    color: Theme.of(context).errorColor,
                                    icon: Icons.delete,
                                    onPressed: () {_.apagarContaOnTap();},
                                  )
                              );
                            },
                          ),
                        ),

                      ],
                    ),

                    SizedBox (height: 30,),

                  ],
                ),
              ),
            ),

          );

        });
  }
}
