import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';

class TextCheckAccount extends StatelessWidget {
  final bool firstAcess;
  final VoidCallback press;
  const TextCheckAccount({
    Key? key, 
    required this.firstAcess, 
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Text(
          firstAcess ? 'Este é o seu primeiro acesso? ' : 'Já logou anteriormente? ',
          style: const TextStyle(
            color: subText
          )
        ),
        GestureDetector(
          onTap: press,
          child: const Text(
            'Clique Aqui',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: primaryColor
            )
          ),
        )
      ]
    );
  }
}
