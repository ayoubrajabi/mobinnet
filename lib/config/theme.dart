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
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(const Color(0xFF00AD4C)),
        side: BorderSide(
          color: Colors.black12,
          width: 0.7,
        ),
        splashRadius: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(
            color: Colors.black12,
            width: 0.1,
          ),
        ),
      ),
      cardColor: const Color(0xFFF5F7FA),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 12.0,
          color: const Color(0xFFA0A8C2),
        ),
      ),
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: const TextStyle(
          fontFamily: 'shabnam',
          fontSize: 12.0,
          color: const Color(0xFF045453),
          fontWeight: FontWeight.w300,
        ),
        labelColor: const Color(0xFF045453),
        unselectedLabelColor: const Color(0xFFA0A8C2),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'shabnam',
          fontSize: 12.0,
          color: const Color(0xFFA0A8C2),
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
