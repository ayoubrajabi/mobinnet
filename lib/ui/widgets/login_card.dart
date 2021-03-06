import 'package:flutter/material.dart';

import './widgets.dart';

class LoginCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData? _theme = Theme.of(context);
    final MediaQueryData? _mediaQuery = MediaQuery.of(context);
    final bool? _isDesktop = Responsive.isDesktop(context),
        _isTablet = Responsive.isTablet(context),
        _isMobile = Responsive.isMobile(context);

    return Container(
      width: _mediaQuery!.size.width,
      height: Responsive.cardHeight(context),
      color: _theme!.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        textDirection: TextDirection.rtl,
        children: [
          SizedBox(
            width: _isMobile! ? _mediaQuery.size.width * 0.9 : 500,
            child: UserLogin(),
          ),
          if (_isDesktop! || _isTablet!)
            Expanded(
              child: LoginImageCover(),
            )
          else
            const SizedBox(
              width: 15.0,
            ),
        ],
      ),
    );
  }
}
