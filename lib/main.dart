import 'package:flutter/material.dart';
import 'config/config.dart';
import 'ui/screens/login_screen.dart';

void main() {
  runApp(MobinnetApp(
    appRoute: AppRoute(),
  ));
}

class MobinnetApp extends StatelessWidget {
  MobinnetApp({this.appRoute});

  final AppRoute? appRoute;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MobinnetTheme().theme(),
      home: LoginScreen(),
    );
  }
}
