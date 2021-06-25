import 'package:flutter/material.dart';

class MobinnetTheme {
  ThemeData theme() {
    return ThemeData(
      brightness: Brightness.light,
      splashColor: const Color(0xFF00AD4C),
      backgroundColor: const Color(0xFFE1E6EF),
      fontFamily: 'shabnam',
      scaffoldBackgroundColor: const Color(0xFFEEEEEE),
      shadowColor: const Color(0xFFE0E0E0),
      iconTheme: IconThemeData(
        color: const Color(0xFF00AD4C),
      ),
      cardColor: const Color(0xFFF5F7FA),
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: const TextStyle(
          fontSize: 13.0,
          color: Color(0xFF045453),
          fontWeight: FontWeight.bold,
        ),
        labelColor: const Color(0xFF045453),
        unselectedLabelColor: const Color(0xFFA0A8C2),
        unselectedLabelStyle: const TextStyle(
          fontSize: 13.0,
          color: Color(0xFFA0A8C2),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
