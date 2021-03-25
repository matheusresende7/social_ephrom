import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldPadrao extends StatelessWidget {

  final String text;
  final String hintText;
  final double sizeHintText;
  final int maxLength;
  final IconData icon;
  final String prefixText;
  final String suffixText;
  final Widget suffixeIcon;
  final Color color;
  final InputBorder border;
  final EdgeInsetsGeometry contentPadding;
  final Color fillColor;
  final bool autofocus;
  final bool obscureText;
  final bool filled;
  final TextInputType keybordType;
  final VoidCallback onTap;
  final List<TextInputFormatter> inputFormatters;
  final Function (String) validator;
  final String errorText;
  final Function (String) onSaved;
  final Function (String) onChanged;
  final TextEditingController controller;

  TextFormFieldPadrao ({
    this.text,
    this.hintText,
    this.sizeHintText = 21,
    this.maxLength = 50,
    this.icon,
    this.prefixText,
    this.suffixText,
    this.suffixeIcon,
    this.color,
    this.border,
    this.contentPadding = const EdgeInsets.fromLTRB(5, 0, 5, 5),
    this.fillColor = Colors.transparent,
    this.autofocus = false,
    this.obscureText = false,
    this.filled = true,
    this.keybordType = TextInputType.text,
    this.onTap,
    this.inputFormatters,
    this.validator,
    this.errorText,
    this.onSaved,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: this.controller,
        keyboardType: this.keybordType,
        onTap: this.onTap,
        inputFormatters: this.inputFormatters,
        maxLength: this.maxLength,
        maxLines: null,
        validator: this.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onSaved: this.onSaved,
        onChanged: onChanged,
        //focusNode: FocusNode (),
        autofocus: this.autofocus,
        obscureText: this.obscureText,
        cursorColor: Theme.of(context).textSelectionColor,
        style: TextStyle(
          fontSize: this.sizeHintText,
          color: Theme.of(context).textSelectionColor,
        ),
        decoration: InputDecoration(
          //counterText: '',
          contentPadding: EdgeInsets.fromLTRB(25, 0, 25, 25),
          suffixIcon: this.suffixeIcon,
          errorText: this.errorText,
          prefixText: this.prefixText,
          suffixText: this.suffixText,
          prefixStyle: TextStyle(
              fontSize: 21,
              color: Theme.of(context).textSelectionColor
          ),
          suffixStyle: TextStyle(
              fontSize: 21,
              color: Theme.of(context).textSelectionColor
          ),
          labelText: this.text,
          labelStyle: TextStyle(
              fontSize: 21,
              color: Theme.of(context).textSelectionColor
              //color: Colors.grey
          ),
          hintText: this.hintText,
          filled: this.filled,
          fillColor: this.fillColor,
          border: this.border
        ),
      ),
    );

  }
}
