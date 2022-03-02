import 'package:flutter/material.dart';
import 'package:mobile/components/general_components/text_field_container.dart';
import 'package:mobile/constants.dart';

class RoudedTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoudedTextField({
    Key? key, 
    required this.hintText, 
    required this.icon, 
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon, 
            color: textOfTextFieldColor,
          ),
          hintText: hintText,
          border: InputBorder.none,

        ),
      ),
    );
  }
}