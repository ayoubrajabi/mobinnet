import 'package:flutter/material.dart';
import 'package:moninnet_app/ui/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login-screen';

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.backgroundColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          LoginCard(),
          InfoRowWidget(),
        ],
      ),
    );
  }
}
