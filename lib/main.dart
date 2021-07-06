import 'package:flutter/material.dart';
import 'config/config.dart';

void main() {
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
