import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/components/general_components/rounded_button.dart';
import 'package:mobile/components/general_components/rounded_password_field.dart';
import 'package:mobile/components/general_components/rounded_text_field.dart';
import 'package:mobile/components/general_components/text_check_account.dart';
import 'package:mobile/components/login_components/background_login.dart';


import 'package:mobile/constants.dart';
import 'package:mobile/views/finish_first_acess_view.dart';

class BodyFirstAcess extends StatelessWidget {
  const BodyFirstAcess({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundLogin(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
              'Primeiro Acesso',
              style: TextStyle(
                fontSize: 36, 
                color: primaryColor,
                fontWeight: FontWeight.bold
              ),
            ),
            SvgPicture.asset(
              'assets/icons/sign_up_icon.svg',
              height: size.height * 0.25,
            ),
            SizedBox(height: size.height *0.03,),
            RoudedTextField(
              hintText: 'Email',
              icon: Icons.email_outlined,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoudedTextField(
              hintText: 'Repetir Senha',
              icon: Icons.lock_outline,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: 'CONCLUIR ALTERAÇÃO', 
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => const FinishFirstAcessView()),
                );
              }, 
              color: primaryColorLight, 
              textColor: primaryColor
            ),
            SizedBox(height: size.height *0.03,),
            TextCheckAccount(
              firstAcess: false, 
              press: () => Navigator.pop(context),
            )
        ]
      ),
    );
  }
}