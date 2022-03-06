import 'package:flutter/material.dart';
import 'package:mobile/views/finish_first_acess_view.dart';
import 'package:mobile/views/first_acess_view.dart';
import 'package:mobile/views/login_view.dart';
import 'package:mobile/views/welcome_view.dart';

class AppRoutes {
  static const welcome = '/';
  static const login = '/login';
  static const firstAcess = '/firstAcess';
  static const firstAcessFinish = '/firstAcessFinish';

  static final routes = <String, WidgetBuilder>{
    welcome: (BuildContext ctx) => const WelcomeView(),
    login: (BuildContext ctx) => const LoginView(),
    firstAcess: (BuildContext ctx) => const FirstAcessView(),
    firstAcessFinish: (BuildContext ctx) => const FinishFirstAcessView(),
  };
}
