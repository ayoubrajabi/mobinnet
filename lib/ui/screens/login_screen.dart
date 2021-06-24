import 'package:flutter/material.dart';
import 'package:moninnet_app/ui/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login-screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      color: _theme.backgroundColor,
      child: Stack(
        children: [
          Column(
            children: [
              LoginCard(),
              InfoRow(),
            ],
          ),
          LoginScreenLogo(),
        ],
      ),
    );
  }
}
