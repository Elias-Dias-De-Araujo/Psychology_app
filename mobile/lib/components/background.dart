import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // Informa a altura e largura total da tela do dispositivo
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            'assets/images/ellipse_top_left.png',
            width: size.width * 0.3,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(
            'assets/images/ellipse_bottom_left.png',
            width: size.width * 0.2,
          ),
        ),
        child,
      ]),
    );
  }
}