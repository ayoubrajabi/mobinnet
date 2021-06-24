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
    );
  }
}
