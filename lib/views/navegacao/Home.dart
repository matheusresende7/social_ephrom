import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:social_ephrom/controllers/navegacao/HomeController.dart';
import 'package:social_ephrom/repositories/Mocky.dart';
import 'package:social_ephrom/widgets/especificos/BottomSheetFiltros.dart';
import 'package:social_ephrom/widgets/especificos/CardPostagem.dart';

class Home extends StatelessWidget {

  Mocky mocky = Mocky();

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

            body: RefreshIndicator(
              backgroundColor: Theme.of(context).accentColor,
              color: Theme.of(context).primaryColor,
              displacement: 205,
              strokeWidth: 2,
              onRefresh: mocky.refreshMetodo,
              child: CustomScrollView(
                controller: _.scrollController,
                physics: BouncingScrollPhysics(),
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
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(2, 2),
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

                            SizedBox (
                              child: FutureBuilder(
                                  future: mocky.obterPostagensAPI(),
                                  builder: (context, snapshot) {
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.waiting:
                                      case ConnectionState.none:

                                        return SizedBox(
                                          height: 450,
                                          width: 450,
                                          child: Center(
                                            child: Container(
                                              height: 50,
                                              width: 50,
                                              child: CircularProgressIndicator(
                                                backgroundColor: Theme.of(context).disabledColor,
                                                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                                                strokeWidth: 3,
                                              ),
                                            ),
                                          ),
                                        );

                                      default:

                                        if(snapshot.hasError) return Container(
                                          child: Center(
                                            child: Text(
                                                'Tivemos algum problema ao carregar os dados.\n '
                                                'Por favor, tente novamente.',
                                              style: TextStyle(
                                                fontSize: 22,
                                                color: Theme.of(context).textSelectionColor,
                                              ),
                                            ),
                                          ),
                                        );

                                        else return ListView.builder(
                                            physics: NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: snapshot.data['Result'].length,
                                            itemBuilder: (context, index) {

                                              return CardPostagem(
                                                nome: snapshot.data['Result'][index]['AutorNome'] ?? '',
                                                dataHorario: snapshot.data['Result'][index]['DataHora'] ?? '',
                                                imagem: snapshot.data['Result'][index]['AutorImageUrl'] ?? '',
                                                plataforma: 'Android',
                                                area: 'Frontend',
                                                texto: snapshot.data['Result'][index]['Texto'] ?? '',
                                                curtidas: '12',
                                                comentarios: snapshot.data['Result'][index]['Respostas'].toString() ?? 0.toString(),
                                                compartilhamentos: '4',
                                              );

                                            },
                                        );

                                    }
                                  }
                              ),
                            ),

                            SizedBox(height: 10,),

                          ],
                        )
                      ])
                  ),

                ],
              ),
            ),

          );

        }
    );

  }
}
