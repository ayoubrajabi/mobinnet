import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreenLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 5.0,
        right: 20.0,
        child: Stack(
          children: [
            SvgPicture.asset('assets/svg/circle.svg'),
            Positioned(
              top: 115,
              right: 120,
              child: SvgPicture.asset('assets/svg/logo.svg'),
            ),
          ],
        ));
  }
}
