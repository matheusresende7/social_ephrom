import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DropdownButtonFormFieldPadrao extends StatelessWidget {

  final String text;
  final IconData icon;
  final String value;
  final List <DropdownMenuItem <String>> items;
  final bool filled;
  final Function onChanged;
  final Function (String) validator;
  final Function (String) onSaved;

  final Color color;
  final bool autofocus;
  final bool obscureText;
  final TextInputType keybordType;
  final VoidCallback onTap;
  final List<TextInputFormatter> inputFormatters;
  final TextEditingController controller;

  DropdownButtonFormFieldPadrao ({
    this.text,
    this.icon,
    this.value,
    this.items,
    this.filled = true,
    this.onChanged,
    this.validator,
    this.onSaved,

    this.color,
    this.autofocus = false,
    this.obscureText = false,
    this.keybordType = TextInputType.text,
    this.onTap,
    this.inputFormatters,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10),
      child: DropdownButtonFormField (
          value: this.value,
          items: this.items,
          onChanged: this.onChanged,
          onSaved: this.onSaved,
          validator: this.validator,
          isExpanded: true, //para nao dar overwrite no dropdown
          style: TextStyle(
            fontSize: 21,
            color: Theme.of(context).textSelectionColor,
          ),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(25, 0, 25, 25),
              labelText: this.text,
              labelStyle: TextStyle(fontSize: 21,color: Theme.of(context).textSelectionColor),
              filled: this.filled,
              fillColor: Colors.transparent,
            border: InputBorder.none,
          )
      ),
    );

  }
}