import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/components/background_auth.dart';
import 'package:mobile/components/rounded_button.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/routes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);
  final bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    // Informa a altura e largura total da tela do dispositivo
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BgAuth(
        isWelcome: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bem Vindo(a)',
                style: TextStyle(fontSize: 36, color: primary400, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/icons/welcome.svg',
                  height: size.height * 0.5,
                ),
              ),
              RoundedButton(
                text: 'LOGIN',
                press: () {
                  Navigator.of(context).pushNamed(AppRoutes.auth, arguments: isLogin);
                },
                color: primary400,
                textColor: Colors.white,
              ),
              RoundedButton(
                text: 'PRIMEIRO ACESSO',
                press: () {
                  Navigator.of(context).pushNamed(AppRoutes.auth, arguments: !isLogin);
                },
                color: primary500,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
