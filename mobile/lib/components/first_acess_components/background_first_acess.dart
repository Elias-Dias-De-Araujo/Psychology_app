import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/routes.dart';

class BackgroundFirstAcess extends StatelessWidget {
  final Widget child;
  const BackgroundFirstAcess({
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
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Indexer(
              children: [
                Indexed(
                  index: 2,
                  child: Positioned(
                      top: 20,
                      left: 20,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: secondaryColorHsl53,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoutes.welcome);
                        },
                      )),
                ),
                Indexed(
                  index: 1,
                  child: Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset(
                      'assets/images/ellipse_top_left.png',
                      width: size.width * 0.3,
                    ),
                  ),
                ),
                Indexed(
                  index: 1,
                  child: Positioned(
                    bottom: 0,
                    left: 0,
                    child: Image.asset(
                      'assets/images/ellipse_bottom_left.png',
                      width: size.width * 0.2,
                    ),
                  ),
                ),
              ],
            ),
            child,
          ]),
    );
  }
}
