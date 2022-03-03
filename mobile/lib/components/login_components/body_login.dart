import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/components/general_components/input_field.dart';
import 'package:mobile/components/general_components/rounded_button.dart';
import 'package:mobile/components/general_components/rounded_password_field.dart';
import 'package:mobile/components/general_components/rounded_text_field.dart';
import 'package:mobile/components/general_components/text_check_account.dart';
import 'package:mobile/components/login_components/background_login.dart';


import 'package:mobile/constants.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/providers/users.dart';
import 'package:mobile/views/first_acess_view.dart';
import 'package:provider/provider.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  String errorEmail = '';

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
            Form(
              key: _form,
              child: Column(
                children: [
                  InputField(
                    hintText: 'Email', 
                    icon: Icons.email_outlined, 
                    isSecret: false, 
                    notEmpty: true, 
                    onChanged: (String value) {  },
                    onSaved: (String? value) { 
                      _formData['email'] =  value!;
                    },
                    validator: (String? value) { 
                      if (true && (value == null || value.isEmpty)) {
                        return'*Esse campo é obrigatório';
                      }else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)){
                        return 'Digite um email válido';
                      }
                      return null;
                    },
                  ),
                  InputField(
                    hintText: 'Senha', 
                    icon: Icons.lock_outline, 
                    isSecret: true, 
                    notEmpty: true, 
                    onChanged: (String value) {  },
                    onSaved: (String? value) { 
                      _formData['password'] = value!;
                    },
                    validator: (String? value) { 
                      if (true && (value == null || value.isEmpty)) {
                        return 'Esse campo não pode ser vazio';
                      }
                      return null;
                    },
                  ),
                ] 
              )
            ),
            RoundedButton(
              text: 'LOGIN', 
              press: () {
                final isValid = _form.currentState?.validate();

                if (isValid == true) {
                  _form.currentState?.save();

                  print(_formData['email']);
                  print(_formData['password']);
                  /*
                  Provider.of<Users>(context, listen: false).put(User(
                    email: _formData['email'].toString(),
                    password: _formData['password'].toString(),
                  ));
                  */
                }
              }, 
              color: primaryColor, 
              textColor: Colors.white
            ),
            SizedBox(height: size.height *0.03,),
            TextCheckAccount(
              firstAcess: true, 
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const FirstAcessView()),
                );
              },
            )
        ]
      ),
    );
  }
}







