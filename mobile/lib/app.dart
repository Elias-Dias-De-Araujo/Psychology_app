import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/routes.dart';

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
