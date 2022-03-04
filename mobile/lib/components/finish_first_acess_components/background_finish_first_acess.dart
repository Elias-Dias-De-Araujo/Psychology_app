import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';

class BackgroundFinishFirstAcess extends StatelessWidget {
  final Widget child;
  const BackgroundFinishFirstAcess({ 
    Key? key, 
    required this.child 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: primaryColorHsl47,
      width: size.width,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          child,
        ]),
    );
  }
}