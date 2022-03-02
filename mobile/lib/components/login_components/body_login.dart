import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/components/login_components/background_login.dart';
import 'package:mobile/components/login_components/rounded_password_field.dart';
import 'package:mobile/components/login_components/rounded_text_field.dart';
import 'package:mobile/components/login_components/text_check_account.dart';
import 'package:mobile/components/login_components/text_field_container.dart';
import 'package:mobile/components/welcome_components/rounded_button.dart';
import 'package:mobile/constants.dart';

class BodyLogin extends StatelessWidget {
  const BodyLogin({
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
              'Login',
              style: TextStyle(
                fontSize: 36, 
                color: primaryColor,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: size.height *0.05,),
            SvgPicture.asset(
              'assets/icons/sign_in_icon.svg',
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
            RoundedButton(
              text: 'LOGIN', 
              press: () {}, 
              color: primaryColor, 
              textColor: Colors.white
            ),
            SizedBox(height: size.height *0.03,),
            TextCheckAccount(
              firstAcess: true, 
              press: () {},
            )
        ]
      ),
    );
  }
}







