import 'package:flutter/material.dart';
import 'package:mobile/views/auth_page.dart';
import 'package:mobile/views/welcome_page.dart';

class AppRoutes {
  //O welcome fica como '/welcome' para que o '/' possa ser usado pela propriedade
  static const home = '/home';
  static const welcome = '/';
  static const auth = '/auth';

  static final routes = <String, WidgetBuilder>{
    welcome: (BuildContext ctx) => const WelcomePage(),
    auth: (BuildContext ctx) => const AuthPage(),
  };
}
