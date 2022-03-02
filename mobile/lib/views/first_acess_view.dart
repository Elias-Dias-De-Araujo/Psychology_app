import 'package:flutter/material.dart';
import 'package:mobile/components/first_acess_components/body_first_acess.dart';

class FirstAcessView extends StatelessWidget {
  const FirstAcessView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyFirstAcess(),
    );
  }
}