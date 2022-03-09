import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';
import 'package:mobile/constants.dart';

class BgAuth extends StatelessWidget {
  final bool isWelcome;
  final Widget child;
  BgAuth({Key? key, required this.isWelcome, required this.child,}) : super(key: key);
  final List<double?> index1 = [20, 20], index2 = [0, 0], index3 = [0, 0];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(alignment: Alignment.center, children: [
        Indexer(
          children: [
            if(!isWelcome)
            Indexed(
              index: 2,
              child: Positioned(
                  top: index1[0],
                  left: index1[1],
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: secondaryColorHsl53,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )),
            ),
            Indexed(
              index: 1,
              child: Positioned(
                top: index2[0],
                left: index2[1],
                child: Image.asset(
                  'assets/images/ellipse_top_left.png',
                  width: size.width * 0.3,
                ),
              ),
            ),
            Indexed(
              index: 1,
              child: Positioned(
                bottom: index3[0],
                right: index3[1],
                child: Image.asset(
                  'assets/images/ellipse_bottom_right.png',
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
