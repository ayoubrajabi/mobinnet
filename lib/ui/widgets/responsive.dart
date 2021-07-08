import 'package:flutter/material.dart';

class Responsive {
  static bool? isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool? isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 650 &&
      MediaQuery.of(context).size.width < 1100;

  static bool? isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static double? cardHeight(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    if (_height <= 170) {
      return _height * 5.0;
    } else if (_height <= 200) {
      return _height * 4.0;
    } else if (_height <= 250) {
      return _height * 3.4;
    } else if (_height <= 300) {
      return _height * 2.8;
    } else if (_height <= 400) {
      return _height * 2.2;
    } else if (_height <= 500) {
      return _height * 1.8;
    } else if (_height <= 600) {
      return _height * 1.4;
    } else if (_height >= 800) {
      return _height * 0.9;
    }
    return _height * 1.2;
  }

  static double? infoRowHeight(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    if (_height <= 170) {
      return _height * 2.0;
    } else if (_height <= 250) {
      return _height * 1.5;
    } else if (_height <= 300) {
      return _height * 0.7;
    } else if (_height <= 350 || isMobile(context)!) {
      return _height * 0.5;
    } else if (_height <= 500) {
      return _height * 0.3;
    } else if (_height <= 600 || isTablet(context)!) {
      return _height * 0.2;
    }
    return _height * 0.08;
  }
}
