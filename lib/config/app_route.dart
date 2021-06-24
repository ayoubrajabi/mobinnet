import 'package:flutter/material.dart';
import 'package:moninnet_app/ui/screens/login_screen.dart';

class AppRoute {
  Route onGenareteScreens(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LoginScreen.id:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
