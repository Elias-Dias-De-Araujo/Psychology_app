import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/routes.dart';
import 'package:mobile/views/auth_page.dart';
import 'package:mobile/widgets/auth_wrapper.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Psicólogo',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routes: AppRoutes.routes,
    );
  }
}
