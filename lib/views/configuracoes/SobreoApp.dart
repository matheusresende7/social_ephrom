import 'package:flutter/material.dart';

class SobreoApp extends StatefulWidget {
  @override
  _SobreoAppState createState() => _SobreoAppState();
}

class _SobreoAppState extends State<SobreoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (

        extendBodyBehindAppBar: true,

        backgroundColor: Theme.of(context).backgroundColor,

        body: SingleChildScrollView (
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
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

              Card (
                elevation: 4,
                shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                color: Theme.of(context).primaryColor,
                child: Column(
                  children: [
                    ListTile (
                      leading: Icon (
                          Icons.phone_android,
                          color: Theme.of(context).accentColor
                      ),
                      title: Text (
                        'Versão: 1.0.0',
                        style: TextStyle (
                            color: Theme.of(context).accentColor,
                            fontSize: 26,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              cardRecursoApp(text: 'Compartilhamento de ideias e insights entre a equipe de trabalho'),

              cardRecursoApp(text: 'Acesso as novidades e infomações da empresa'),

              cardRecursoApp(text: 'Plataforma para troca de experiências entre a equipe'),

              SizedBox(height: 20),

            ],
          ),
        )
    );
  }

  Widget cardRecursoApp ({
    String text,
  }) {
    return Card (
      elevation: 4,
      shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.fromLTRB(32, 10, 32, 10),
      color: Theme.of(context).accentColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: ListTile (
              leading: Icon (
                  Icons.done_all,
                  color: Theme.of(context).textSelectionColor
              ),
              title: Text (
                text,
                style: TextStyle (
                    color: Theme.of(context).textSelectionColor,
                    fontSize: 19,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}