import 'package:flutter/material.dart';
import 'package:mobile/components/finish_first_acess_components/body_finish_first_acess.dart';

class FinishFirstAcessView extends StatelessWidget {
  const FinishFirstAcessView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyFinishFirstAcess(),
    );
  }
}