import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets.dart';

class LoginScreenLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5.0,
      right: Responsive.isMobile(context) ? 2.0 : 20.0,
      child: Stack(
        children: [
          SvgPicture.asset(
            'assets/svg/circle.svg',
            width: Responsive.isMobile(context) ? 180.0 : 220.0,
            height: Responsive.isMobile(context) ? 180.0 : 220.0,
          ),
          Positioned(
            top: Responsive.isMobile(context) ? 80.0 : 95.0,
            right: Responsive.isMobile(context) ? 80.0 : 100.0,
            child: SvgPicture.asset(
              'assets/svg/logo.svg',
              width: Responsive.isMobile(context) ? 100.0 : 130.0,
            ),
          ),
        ],
      ),
    );
  }
}
