import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/components/background.dart';
import 'package:mobile/components/rounded_button.dart';

import '../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Informa a altura e largura total da tela do dispositivo
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bem Vindo(a)',
              style: TextStyle(
                fontSize: 20, 
                color: primaryColor,
                fontWeight: FontWeight.bold
              ),
              ),
            SizedBox(height: size.height *0.03,),
            SvgPicture.asset(
              'assets/icons/welcome.svg', 
              height: size.height * 0.5,
            ),
            
            RoundedButton(
              text: 'LOGIN',
              press: () {},
              color: primaryColor,
              textColor: Colors.white,
            ),
            RoundedButton(
              text: 'PRIMEIRO ACESSO',
              press: () {},
              color: primaryColorLight,
              textColor: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}



