import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_ephrom/widgets/gerais/TooltipFormato.dart';

class RowResultado extends StatelessWidget {

  final String caracteristica;
  final String valor;
  final String toolTip;
  final Color color;
  final Color tooltipColor;
  final Color backgroundColor;

  RowResultado ({
    this.caracteristica,
    this.valor,
    this.toolTip = '',
    this.color = const Color(0xff060056),
    this.tooltipColor = const Color(0xff0000cc),
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      color: this.backgroundColor,

      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Tooltip(
              waitDuration: Duration(seconds: 1),
              showDuration: Duration(seconds: 3),
              padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              preferBelow: false,
              margin: EdgeInsets.fromLTRB(40, 10, 130, 10),
              height: 60,
              verticalOffset: 5,
              textStyle: TextStyle(
                fontSize: 16,
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
              ),
              decoration: ShapeDecoration(
                color: Theme.of(context).primaryColorDark,
                shape: TooltipFormato(
                  radius: 20,
                  arrowWidth: 20,
                  arrowHeight: 10,
                  arrowArc: 0.4,
                ),
                shadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 3,
                    blurRadius: 5,
                    //offset: Offset(1, 1),
                  ),
                ],
              ),
              message: this.toolTip,
              child: Row(
                children: [

                  Text (
                    this.caracteristica,
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 17,
                    ),
                  ),

                  SizedBox(width: 5,),

                  Column(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 15,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      SizedBox(height: 5,),
                    ],
                  ),

                ],
              ),
            ),

            SizedBox(width: 20,),

            Text (
              this.valor,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
              ),
            ),

          ],
        ),
      ),
    );

  }
}
