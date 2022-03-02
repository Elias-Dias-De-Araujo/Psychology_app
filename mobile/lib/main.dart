import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/views/login_view.dart';
import 'package:mobile/views/welcome_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Psychology_app',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white
      ),
      home: LoginView(),
    );
  }
}
