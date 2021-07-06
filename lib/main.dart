import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'config/config.dart';

void main() {
  setPathUrlStrategy();

  runApp(
    MobinnetApp(
      appRoute: AppRoute(),
    ),
  );
}

class MobinnetApp extends StatelessWidget {
  MobinnetApp({this.appRoute});

  final AppRoute? appRoute;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مبین نت',
      debugShowCheckedModeBanner: false,
      theme: MobinnetTheme().theme(),
      onGenerateRoute: appRoute!.onGenareteScreens,
    );
  }
}
