import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/components/general_components/background_2.dart';
import 'package:mobile/components/general_components/input_field.dart';
import 'package:mobile/components/general_components/rounded_button.dart';
import 'package:mobile/components/general_components/text_check_account.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/routes.dart';

class LoginView extends StatefulWidget {
  const LoginView({ Key? key }) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background2(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Login',
            style: TextStyle(
                fontSize: 36,
                color: primaryColorHsl37,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          SvgPicture.asset(
            'assets/icons/sign_in_icon.svg',
            height: size.height * 0.25,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Form(
              key: _form,
              child: Column(children: [
                InputField(
                  hintText: 'Email',
                  icon: Icons.email_outlined,
                  isSecret: false,
                  notEmpty: true,
                  onChanged: (String value) {},
                  onSaved: (String? value) {
                    _formData['email'] = value!;
                  },
                  validator: (String? value) {
                    if (true && (value == null || value.isEmpty)) {
                      return '*Esse campo é obrigatório';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                        .hasMatch(value)) {
                      return '*Digite um email válido';
                    }
                    return null;
                  },
                ),
                InputField(
                  hintText: 'Senha',
                  icon: Icons.lock_outline,
                  isSecret: true,
                  notEmpty: true,
                  onChanged: (String value) {},
                  onSaved: (String? value) {
                    _formData['password'] = value!;
                  },
                  validator: (String? value) {
                    if (true && (value == null || value.isEmpty)) {
                      return '*Esse campo é obrigatório';
                    }
                    return null;
                  },
                ),
              ])),
          RoundedButton(
              text: 'LOGIN',
              press: () {
                final isValid = _form.currentState?.validate();

                if (isValid == true) {
                  _form.currentState?.save();

                  /* Provider.of<Users>(context, listen: false).put(User(
                    email: _formData['email'].toString(),
                    password: _formData['password'].toString(),
                  )); */

                  Navigator.of(context).pushNamed(AppRoutes.mainView);
                }
              },
              color: primaryColorHsl37,
              textColor: Colors.white),
          SizedBox(
            height: size.height * 0.03,
          ),
          TextCheckAccount(
              firstAcess: true,
              press: () {
                Navigator.of(context).pushNamed(AppRoutes.firstAcess);
              })
        ]),
      ),
    );
  }
}

