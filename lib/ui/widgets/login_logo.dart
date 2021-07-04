import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moninnet_app/constant/constants.dart';

import 'widgets.dart';

class LoginScreenLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool? _isMobile = Responsive.isMobile(context);

    return Positioned(
      top: 5.0,
      right: _isMobile! ? 0.0 : 10.0,
      child: Stack(
        children: [
          SvgPicture.asset(
            SvgAssets.circle!,
            width: 250.0,
            height: 250.0,
          ),
          Positioned(
            top: 110.0,
            right: 105.0,
            child: SvgPicture.asset(
              SvgAssets.logo!,
              width: 160.0,
            ),
          ),
        ],
      ),
    );
  }
}
