import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/components/general_components/rounded_button.dart';
import 'package:mobile/components/welcome_components/background_welcome.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/routes.dart';
import 'package:mobile/views/first_acess_view.dart';
import 'package:mobile/views/login_view.dart';

class BodyWelcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Informa a altura e largura total da tela do dispositivo
    Size size = MediaQuery.of(context).size;
    return BackgroundWelcome(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bem Vindo(a)',
              style: TextStyle(
                  fontSize: 36,
                  color: primaryColorHsl37,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              'assets/icons/welcome.svg',
              height: size.height * 0.5,
            ),
            RoundedButton(
              text: 'LOGIN',
              press: () {
                Navigator.of(context).pushNamed(AppRoutes.login);
              },
              color: primaryColorHsl37,
              textColor: Colors.white,
            ),
            RoundedButton(
              text: 'PRIMEIRO ACESSO',
              press: () {
                Navigator.of(context).pushNamed(AppRoutes.firstAcess);
              },
              color: primaryColorLight,
              textColor: primaryColorHsl37,
            ),
          ],
        ),
      ),
    );
  }
}
