import 'package:flutter/material.dart';
import 'package:mobile/components/welcome_components/body_welcome.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyWelcome(),
    );
  }
}
