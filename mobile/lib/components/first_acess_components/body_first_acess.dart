import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/components/general_components/input_field.dart';
import 'package:mobile/components/general_components/rounded_button.dart';
import 'package:mobile/components/general_components/rounded_password_field.dart';
import 'package:mobile/components/general_components/rounded_text_field.dart';
import 'package:mobile/components/general_components/text_check_account.dart';
import 'package:mobile/components/login_components/background_login.dart';


import 'package:mobile/constants.dart';
import 'package:mobile/views/finish_first_acess_view.dart';
import 'package:mobile/views/login_view.dart';

class BodyFirstAcess extends StatefulWidget {
  const BodyFirstAcess({
    Key? key,
  }) : super(key: key);

  @override
  State<BodyFirstAcess> createState() => _BodyFirstAcessState();
}

class _BodyFirstAcessState extends State<BodyFirstAcess> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  
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
                    onChanged: (String value) { 
                      _formData['password'] = value;
                    },
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
                  InputField(
                    hintText: 'Repetir Senha', 
                    icon: Icons.lock_outline, 
                    isSecret: true, 
                    notEmpty: true, 
                    onChanged: (String value) {  },
                    onSaved: (String? value) { 
                      _formData['repeatPassword'] = value!;
                    },
                    validator: (String? value) { 
                      if (true && (value == null || value.isEmpty)) {
                        return 'Esse campo não pode ser vazio';
                      }else if(value != _formData['password']) {
                        return 'As senhas não são iguais';
                      }
                      return null;
                    },
                  ),
                ] 
              )
            ),
            RoundedButton(
              text: 'CONCLUIR ALTERAÇÃO', 
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
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FinishFirstAcessView()),
                  );
                }
              }, 
              color: primaryColorLight, 
              textColor: primaryColor
            ),
            SizedBox(height: size.height *0.03,),
            TextCheckAccount(
              firstAcess: false, 
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginView()
                    ),
                  );
              },
            )
        ]
      ),
    );
  }
}