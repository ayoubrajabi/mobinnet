import 'package:flutter/material.dart';
import 'widgets.dart';

class LoginCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _width = MediaQuery.of(context).size.width;
    final _hieght = MediaQuery.of(context).size.height;

    return Container(
      width: _width,
      height: _hieght * 0.9,
      color: _theme.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        textDirection: TextDirection.rtl,
        children: [
          SizedBox(
            width: 500,
            child: UserLogin(),
          ),
          Expanded(
            child: LoginImageCover(),
          ),
        ],
      ),
    );
  }
}
