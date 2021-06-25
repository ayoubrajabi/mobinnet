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
      height: _hieght * 0.8,
      margin: EdgeInsets.fromLTRB(70.0, 60.0, 70.0, 20.0),
      decoration: BoxDecoration(
        color: _theme.cardColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          LoginImageCover(),
          UserLogin(),
        ],
      ),
    );
  }
}
