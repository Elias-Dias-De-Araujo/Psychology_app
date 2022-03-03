import 'package:flutter/material.dart';
import 'package:mobile/components/general_components/text_field_container.dart';
import 'package:mobile/constants.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final bool notEmpty;
  final bool isSecret;
  const InputField({
    Key? key,
    required this.onChanged,
    required this.hintText,
    required this.icon,
    required this.notEmpty,
    required this.isSecret, 
    required this.onSaved, 
    required this.validator,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool noVisibility = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
      obscureText: widget.isSecret ? noVisibility : widget.isSecret,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        icon: Icon(
          widget.icon,
          color: textOfTextFieldColor,
        ),
        suffixIcon: widget.isSecret == true
          ? GestureDetector(
            onTap: _changeVisibility,
            child: Icon(
              noVisibility
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
                color: textOfTextFieldColor,
              ),
            )
          : null,
        border: InputBorder.none),
        validator: widget.validator,
        onSaved: widget.onSaved,
      )
    );
  }

  void _changeVisibility() {
    setState(() => noVisibility = !noVisibility);
  }
}