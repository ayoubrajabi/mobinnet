import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moninnet_app/constant/constants.dart';

class MobinnetLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 30.0,
          right: 0.0,
          child: SvgPicture.asset(
            SvgAssets.circle!,
            width: 250.0,
            height: 250.0,
          ),
        ),
        Positioned(
          top: 135.0,
          right: 110.0,
          child: SvgPicture.asset(
            SvgAssets.logo!,
            width: 180.0,
          ),
        ),
      ],
    );
  }
}
