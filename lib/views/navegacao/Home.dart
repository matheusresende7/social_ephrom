import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:social_ephrom/controllers/navegacao/HomeController.dart';
import 'package:social_ephrom/widgets/especificos/BottomSheetFiltros.dart';
import 'package:social_ephrom/widgets/especificos/CardPostagem.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {

          return Scaffold(

            key: _.scaffoldKey,

            extendBodyBehindAppBar: true,

            backgroundColor: Theme.of(context).backgroundColor,

            floatingActionButton: Align(
              alignment: Alignment(1.05, 0.85),
              child: FloatingActionButton(
                child: Icon(
                  Icons.keyboard_arrow_up,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
                backgroundColor: Theme.of(context).accentColor,
                splashColor: Colors.grey[50],
                mini: true,
                elevation: 4,
                onPressed: () {_.scrollToTopMetodo();},
              ),
            ),

            body: CustomScrollView(
              controller: _.scrollController,
              slivers: [

                SliverAppBar(
                    automaticallyImplyLeading: false,
                    expandedHeight: 100,
                    floating: false,
                    pinned: false,
                    snap: false,
                    elevation: 0,
                    backgroundColor: Theme.of(context).primaryColor,
                    brightness: Brightness.light,
                    flexibleSpace: SafeArea(
                        child: FlexibleSpaceBar(
                          background: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Row(
                                    children: [

                                      Container(
                                        height: 70,
                                        width: 70,
                                        child: Card (
                                          elevation: 8,
                                          shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular(12)),
                                          color: Theme.of(context).accentColor,
                                          child: Align(
                                            alignment: Alignment(0, -0.5),
                                            child: Text (
                                              'o',
                                              style: TextStyle(
                                                fontSize: 45,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context).primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox (width: 10,),

                                      Text (
                                        'Social Ephrom',
                                        style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).accentColor,
                                          letterSpacing: 2,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),

                                    ],
                                  ),

                                ],
                              ),
                            ],
                          ),
                        )
                    )
                ),

                SliverAppBar(
                  automaticallyImplyLeading: false,
                  floating: false,
                  pinned: true,
                  snap: false,
                  backgroundColor: Colors.transparent,
                  brightness: Brightness.light,
                  elevation: 0,
                  expandedHeight: 0,
                  flexibleSpace: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: Offset(2, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Theme.of(context).accentColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  Icon(
                                    Icons.search,
                                    size: 28,
                                    color: Theme.of(context).primaryColor,
                                  ),

                                  Container(
                                    width: 180,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: TextFormField(
                                        controller: _.controllerPesquisa,
                                        textInputAction: TextInputAction.search,
                                        onChanged: (valor) {_.opacityItens();},
                                        style: TextStyle(
                                          fontSize: 21,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: 'Pesquisar...',
                                          labelStyle: TextStyle(
                                            fontSize: 21,
                                            color: Theme.of(context).primaryColor,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),

                                  Opacity(
                                    opacity: _.apagarEBarraVisiveis,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.close,
                                        size: 28,
                                        color: Theme.of(context).disabledColor,
                                      ),
                                      onPressed: _.apagarEBarraVisiveisBool
                                          ? () {_.apagarPesquisa();}
                                          : null,
                                    ),
                                  ),

                                  Opacity(
                                    opacity: _.apagarEBarraVisiveis,
                                    child: Container(
                                      color: Theme.of(context).disabledColor,
                                      width: 1,
                                      height: 25,
                                    ),
                                  ),

                                  IconButton(
                                    icon: Icon(
                                      Icons.filter_list,
                                      size: 28,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    onPressed: () {
                                      Get.bottomSheet(
                                        BottomSheetFiltros(),
                                        isScrollControlled: true,
                                        backgroundColor: Theme.of(context).accentColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(40),
                                            topRight: Radius.circular(40),
                                          ),
                                        ),
                                      );
                                    },
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SliverList(
                    delegate: SliverChildListDelegate([
                      Column (
                        children: [

                          SizedBox(height: 10,),

                          CardPostagem (
                            nome: _.nome1,
                            dataHorario: _.dataHorario1,
                            imagem: _.imagem1,
                            plataforma: _.plataforma1,
                            area: _.area1,
                            texto: _.texto1,
                            curtidas: _.curtidas1,
                            comentarios: _.comentarios1,
                            compartilhamentos: _.compartilhamentos1,
                          ),

                          CardPostagem (
                            nome: _.nome2,
                            dataHorario: _.dataHorario2,
                            imagem: _.imagem2,
                            plataforma: _.plataforma2,
                            area: _.area2,
                            texto: _.texto2,
                            curtidas: _.curtidas2,
                            comentarios: _.comentarios2,
                            compartilhamentos: _.compartilhamentos2,
                          ),

                          CardPostagem (
                            nome: _.nome3,
                            dataHorario: _.dataHorario3,
                            imagem: _.imagem3,
                            plataforma: _.plataforma3,
                            area: _.area3,
                            texto: _.texto3,
                            curtidas: _.curtidas3,
                            comentarios: _.comentarios3,
                            compartilhamentos: _.compartilhamentos3,
                          ),

                          CardPostagem (
                            nome: _.nome4,
                            dataHorario: _.dataHorario4,
                            imagem: _.imagem4,
                            plataforma: _.plataforma4,
                            area: _.area4,
                            texto: _.texto4,
                            curtidas: _.curtidas4,
                            comentarios: _.comentarios4,
                            compartilhamentos: _.compartilhamentos4,
                          ),

                          CardPostagem (
                            nome: _.nome5,
                            dataHorario: _.dataHorario5,
                            imagem: _.imagem5,
                            plataforma: _.plataforma5,
                            area: _.area5,
                            texto: _.texto5,
                            curtidas: _.curtidas5,
                            comentarios: _.comentarios5,
                            compartilhamentos: _.compartilhamentos5,
                          ),

                          CardPostagem (
                            nome: _.nome6,
                            dataHorario: _.dataHorario6,
                            imagem: _.imagem6,
                            plataforma: _.plataforma6,
                            area: _.area6,
                            texto: _.texto6,
                            curtidas: _.curtidas6,
                            comentarios: _.comentarios6,
                            compartilhamentos: _.compartilhamentos6,
                          ),

                          SizedBox (height: 80,),

                        ],
                      )
                    ])
                ),

              ],
            ),

          );

        }
    );

  }
}
