import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/components/background_auth.dart';
import 'package:mobile/components/input_field.dart';
import 'package:mobile/components/rounded_button.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
  final confirmSenha = TextEditingController();

  bool isLogin = false;
  late String titulo;
  late String actionButton;
  late String toggleButton;
  late String asset;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        titulo = 'Bem vindo';
        actionButton = 'Login';
        toggleButton = 'Ainda não tem conta?';
        asset = 'assets/icons/sign_in_icon.svg';
      } else {
        titulo = 'Crie sua conta';
        actionButton = 'Cadastrar';
        toggleButton = 'Já logou anteriormente?';
        asset = 'assets/icons/sign_up_icon.svg';
      }
    });
  }

  login() async {
    setState(() => loading = true);
    try {
      await context.read<AuthProvider>().login(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  registrar() async {
    setState(() => loading = true);
    try {
      await context.read<AuthProvider>().registrar(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    bool args = ModalRoute.of(context)?.settings.arguments as bool;
    setFormAction(args);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: BgAuth(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          titulo,
          style: const TextStyle(fontSize: 36, color: primaryColorHsl37, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            asset,
            height: size.height * 0.25,
          ),
        ),
        Form(
            key: _formKey,
            child: Column(children: [
              InputField(
                hintText: 'Email',
                icon: Icons.email_outlined,
                isSecret: false,
                notEmpty: true,
                controller: email,
                validator: (String? value) {
                  if (true && (value == null || value.isEmpty)) {
                    return '*Esse campo é obrigatório';
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)) {
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
                controller: senha,
                validator: (String? value) {
                  if (true && (value == null || value.isEmpty)) {
                    return '*Esse campo é obrigatório';
                  }
                  return null;
                },
              ),
              if (!isLogin)
                //Caso seja registro, fazer 3° input para confirmação de senha
                InputField(
                  hintText: 'Repetir Senha',
                  icon: Icons.lock_outline,
                  isSecret: true,
                  notEmpty: true,
                  controller: confirmSenha,
                  validator: (String? value) {
                    if (true && (value == null || value.isEmpty)) {
                      return '*Esse campo é obrigatório';
                    } else if (value != senha.text) {
                      return '*As senhas não são iguais';
                    }
                    return null;
                  },
                ),
            ])),
        RoundedButton(
          text: actionButton,
          press: () {
            if (_formKey.currentState!.validate()) {
              if (isLogin) {
                login();
              } else {
                registrar();
              }
            }
          },
          color: primaryColorHsl37,
          textColor: Colors.white,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(toggleButton),
            TextButton(
              onPressed: () => setFormAction(!isLogin),
              child: const Text('Clique aqui.',
                  style: TextStyle(fontWeight: FontWeight.bold, color: secondaryColorHsl43)),
            ),
          ],
        ),
      ]),
    ));
  }
}
