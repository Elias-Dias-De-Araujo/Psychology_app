import 'package:flutter/material.dart';
import 'package:mobile/components/general_components/text_field_container.dart';
import 'package:mobile/constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged
  }) : super(key: key);
  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool visibility = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: visibility,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: 'Senha',
          icon: const Icon(
            Icons.lock_outline,
            color: textOfTextFieldColor,
          ),
          suffixIcon: GestureDetector(
            onTap: _changeVisibility,
            child: Icon(
              visibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              color: textOfTextFieldColor,
            ),
          ),
          border: InputBorder.none
        ),
      )
    );
  }

  void _changeVisibility() {
    setState(() => visibility = !visibility);
  }
}