import 'package:flutter/material.dart';

class AppColors {
  static const Color RED = Color.fromARGB(255, 248, 101, 92);
  static const Color ORANGE = Color.fromARGB(255, 249, 173, 95);
  static const Color BACKGROUND_COLOR = Color.fromARGB(255, 249, 249, 249);
  static const Color WHITE = Color.fromARGB(255, 255, 255, 255);
  static const Color CYAN = Color.fromARGB(255, 6, 237, 254);
  static const Color BLUE = Color.fromARGB(255, 76, 170, 250);
  static const Color GREEN = Color.fromARGB(255, 36, 232, 167);
  static const Color DARK_GREEN = Color.fromARGB(255, 23, 206, 197);
  static const Color TEXT = Color.fromARGB(255, 59, 80, 104);
  static const Color HINT_COLOR = Color.fromARGB(255, 136, 155, 178);
  static const Color CARD_SHADOW_COLOR = Color.fromRGBO(0, 0, 0, 0.1);
  static const Color FLOATING_BUTTON_SHADOW_COLOR = Color.fromRGBO(0, 0, 0, 0.2);
  static const Color ERROR_COLOR = Color.fromRGBO(255, 0, 0, 1.0);

  static const Gradient BOTTOM_WAVE_GRADIENT = RadialGradient(
      center: Alignment.bottomLeft,
      radius: 1.0,
      colors: [AppColors.CYAN, AppColors.BLUE],
  );

  static const Gradient TOP_WAVE_GRADIENT = RadialGradient(
    colors: [AppColors.ORANGE, AppColors.RED],
    radius: 1.0,
    center: Alignment.topLeft,
  );

  static const Gradient FLOATING_BUTTON_GRADIENT = LinearGradient(
    colors: [AppColors.DARK_GREEN, AppColors.GREEN],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight
  );

  static const Gradient TOP_BAR_GRADIENT = RadialGradient(
    colors: [AppColors.ORANGE, AppColors.RED],
    radius: 3.0,
    center: Alignment.centerLeft,
  );

  static const Gradient FADE_GRADIENT = RadialGradient(
    colors: [Color.fromRGBO(255, 255, 255, 1), Color.fromRGBO(255, 255, 255, 0.0)],
    radius: 2.7,
    center: Alignment.centerLeft,
  );
}