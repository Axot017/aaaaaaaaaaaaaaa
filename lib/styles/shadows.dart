import 'package:aaaaaaaaaaaaaaa/styles/colors.dart';
import 'package:flutter/material.dart';

class AppShadows {
  static const List<BoxShadow> CARD_SHADOW = [
    BoxShadow(
        color: AppColors.CARD_SHADOW_COLOR,
        blurRadius: 5.0,
        spreadRadius: 1.0,
        offset: Offset(
            1.0,
            1.0
        )
    )
  ];

  static const List<BoxShadow> FLOATING_BUTTON_SHADOW = [
    BoxShadow(
        color: AppColors.FLOATING_BUTTON_SHADOW_COLOR,
        blurRadius: 5.0,
        spreadRadius: 1.0,
        offset: Offset(
            1.0,
            1.0
        )
    )
  ];
}