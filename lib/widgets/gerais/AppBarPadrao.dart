import 'package:flutter/material.dart';

class AppBarPadrao extends StatelessWidget implements PreferredSizeWidget {

  final String text;
  final IconButton iconButtonMenu;
  final List<Widget> action;

  AppBarPadrao ({
    this.text,
    this.iconButtonMenu,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text (
          this.text,
          style: TextStyle (
            color: Theme.of(context).accentColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.elliptical(250, 10),
            bottomLeft: Radius.elliptical(250, 10),
          ),
        ),
        leading: this.iconButtonMenu,
        actions: this.action,
    );
  }

  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
