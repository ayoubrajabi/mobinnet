import 'package:flutter/material.dart';

import 'ui/screens/login_screen.dart';

void main() {
  runApp(MobinnetApp());
}

class MobinnetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
