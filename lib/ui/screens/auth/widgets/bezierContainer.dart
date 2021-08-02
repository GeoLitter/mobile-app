import 'dart:math';

import 'package:ecocrypt/ui/constants/theme_colors.dart';
import 'package:ecocrypt/ui/screens/auth/widgets/clipPainter.dart';
import 'package:flutter/material.dart';

class BezierContainer extends StatelessWidget {
  const BezierContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Transform.rotate(
      angle: -pi / 3.5,
      child: ClipPath(
        clipper: ClipPainter(),
        child: Container(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [backgroundColor, primaryColor])),
        ),
      ),
    ));
  }
}
