import 'package:flutter/widgets.dart';

class AppColors {
  AppColors._();
  static const Color darkPurple = Color.fromRGBO(25, 11, 40, 1);
  static const Color lightRed = Color.fromRGBO(255, 67, 44, 74);
  static const Color green = Color.fromRGBO(0, 171, 68, 1);
  static const Color darkRed = Color.fromRGBO(216, 1, 1, 1);
  static final BoxDecoration transparentWhite = BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    color: const Color.fromRGBO(255, 255, 255, 0.2),
  );
}
