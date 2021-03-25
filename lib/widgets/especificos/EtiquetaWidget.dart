import 'package:flutter/material.dart';

class EtiquetaWidget extends StatelessWidget {

  final String text;

  EtiquetaWidget ({
    this.text,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text (
          this.text,
          style: TextStyle (
            color: Theme.of(context).accentColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

  }
}
