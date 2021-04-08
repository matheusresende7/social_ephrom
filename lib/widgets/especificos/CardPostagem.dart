import 'package:flutter/material.dart';
import 'package:social_ephrom/controllers/navegacao/HomeController.dart';
import 'package:social_ephrom/widgets/especificos/EtiquetaWidget.dart';
import 'package:social_ephrom/widgets/gerais/DividerPadrao.dart';
import 'package:social_ephrom/widgets/gerais/IconText.dart';
import 'package:social_ephrom/widgets/gerais/IconTextInvert.dart';
import 'package:social_ephrom/widgets/gerais/PopupMenuItemPadrao.dart';
import 'package:social_ephrom/widgets/gerais/SnackBarUndoPadrao.dart';
import 'package:transparent_image/transparent_image.dart';

class CardPostagem extends StatelessWidget {

  final String nome;
  final String dataHorario;
  final String imagem;
  final String plataforma;
  final String area;
  final String texto;
  final String curtidas;
  final String comentarios;
  final String compartilhamentos;

  CardPostagem ({
    this.nome,
    this.dataHorario,
    this.imagem,
    this.plataforma,
    this.area,
    this.texto,
    this.curtidas,
    this.comentarios,
    this.compartilhamentos,
  });

  HomeController home = HomeController();

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 4,
      color: Theme.of(context).accentColor,
      margin: const EdgeInsets.fromLTRB(10, 12, 10, 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipPath(
        clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            )
        ),
        child: Container(
            decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                    color: Theme.of(context).primaryColorLight,
                    width: 4,
                  )
              ),
              color: Theme.of(context).accentColor,
            ),
            child: Container(
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 18, 4, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  ClipOval(
                                    child: FadeInImage.memoryNetwork(
                                      placeholder: kTransparentImage,
                                      image: this.imagem,
                                      height: 55,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  SizedBox(width: 10,),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text (
                                        this.nome,
                                        style: TextStyle (
                                          color: Theme.of(context).textSelectionColor,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      SizedBox(height: 5,),

                                      Row(
                                        children: [

                                          Icon(
                                            Icons.watch_later_outlined,
                                            size: 18,
                                            color: Theme.of(context).textSelectionColor,
                                          ),

                                          SizedBox(width: 5,),

                                          Text (
                                            this.dataHorario,
                                            style: TextStyle (
                                              color: Theme.of(context).textSelectionColor,
                                              fontSize: 14,
                                            ),
                                          ),

                                        ],
                                      ),

                                    ],
                                  ),

                                ],
                              ),

                              SizedBox(height: 15,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  EtiquetaWidget(text: this.plataforma,),

                                  SizedBox(width: 10,),

                                  EtiquetaWidget(text: this.area,),

                                ],
                              ),

                              SizedBox(height: 15,),

                              Text (
                                this.texto,
                                style: TextStyle (
                                  color: Theme.of(context).textSelectionColor,
                                  fontSize: 19,
                                ),
                              ),

                            ],
                          ),
                        ),

                        Container(
                          height: 20,
                          width: 30,
                          child: PopupMenuButton(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            color: Theme.of(context).accentColor,
                            icon: Icon(
                              Icons.more_vert,
                              size: 22,
                              color: Theme.of(context).primaryColor,
                            ),
                            itemBuilder: (BuildContext context) => [
                              PopupMenuItemPadrao(
                                value: 0,
                                icon: Icons.edit,
                                text: 'Editar',
                              ),
                              PopupMenuItemPadrao(
                                value: 1,
                                icon: Icons.delete,
                                text: 'Excluir',
                              ),
                            ],
                            onSelected: (valor) {
                              if (valor == 0) {}
                              else if (valor == 1) {
                                SnackBarUndoPadrao(
                                  message: 'Postagem excluída com sucesso.',
                                  icon: Icons.delete,
                                  backgroundColor: Theme.of(context).errorColor,
                                  onPressed: () {},
                                );
                              }
                            },
                          ),
                        )

                      ],
                    ),

                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Visibility(
                          visible: true,//home.curtidasVisivel,
                          child: IconText(
                            icon: Icons.thumb_up_sharp,
                            text: this.curtidas,
                            color: Theme.of(context).primaryColor,
                          )
                        ),

                        Row(
                          children: [

                            Visibility(
                              visible: true,//home.comentariosVisivel,
                              child: IconTextInvert (
                                icon: Icons.mode_comment,
                                text: this.comentarios,
                                color: Theme.of(context).primaryColor,
                              )
                            ),

                            SizedBox(width: 10,),

                            Visibility(
                              visible: true,//home.compatilhamentosVisivel,
                              child: IconTextInvert (
                                icon: Icons.reply,
                                text: this.compartilhamentos,
                                color: Theme.of(context).primaryColor,
                              )
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),

                  DividerPadrao(),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                    child: Row (
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        IconText(
                          icon: Icons.thumb_up_alt_outlined,
                          text: 'Curtir',
                          color: Theme.of(context).textSelectionColor,
                        ),

                        IconTextInvert (
                          icon: Icons.mode_comment_outlined,
                          text: 'Comentar',
                          color: Theme.of(context).textSelectionColor,
                        ),

                        IconTextInvert (
                          icon: Icons.reply,
                          text: 'Compartilhar',
                          color: Theme.of(context).textSelectionColor,
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            )
        ),
      ),
    );

  }
}
