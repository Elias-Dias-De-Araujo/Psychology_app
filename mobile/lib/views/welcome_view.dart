import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/components/general_components/rounded_button.dart';
import 'package:mobile/components/general_components/background_1.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/routes.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Informa a altura e largura total da tela do dispositivo
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background1(
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
      ),
    );
  }
}
