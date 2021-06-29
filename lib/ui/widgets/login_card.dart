import 'package:flutter/material.dart';
import 'widgets.dart';

class LoginCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _width = MediaQuery.of(context).size.width;
    final _hieght = MediaQuery.of(context).size.height;
    final _isDesktop = Responsive.isDesktop(context);
    final _isTablet = Responsive.isTablet(context);
    final _isMobile = Responsive.isMobile(context);

    return Container(
      width: _width,
      height: _isMobile ? _hieght : _hieght * 0.9,
      color: _theme.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        textDirection: TextDirection.rtl,
        children: [
          SizedBox(
            width: _isMobile ? _width * 0.9 : 500,
            child: UserLogin(),
          ),
          _isDesktop || _isTablet
              ? Expanded(
                  child: LoginImageCover(),
                )
              : const SizedBox(
                  width: 15.0,
                ),
        ],
      ),
    );
  }
}
