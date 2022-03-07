import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/components/general_components/rounded_button.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/routes.dart';

class FinishFirstAcessView extends StatelessWidget {
  const FinishFirstAcessView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
      color: primaryColorHsl47,
      width: size.width,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/complet_sign_up.svg',
                height: size.height * 0.25,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Wrap(
                children: const [
                  Text(
                    'Primeiro Acesso Concluído',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              RoundedButton(
                  text: 'IR PARA LOGIN',
                  press: () {
                    Navigator.of(context).pushNamed(AppRoutes.login);
                  },
                  color: secondaryColorHsl53,
                  textColor: Colors.white),
            ],
          ),
        ]),
      ),
    );
  }
}