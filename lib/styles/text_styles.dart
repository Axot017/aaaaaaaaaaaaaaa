import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyles {
  static const TextStyle LOGIN_FORM_STYLE = TextStyle(
      color: AppColors.HINT_COLOR,
      fontSize: 18
  );

  static const TextStyle CARD_TITLE = TextStyle(
      color: AppColors.TEXT,
      fontWeight: FontWeight.w600,
      fontSize: 14
  );

  static const TextStyle CARD_SUBTITLE = TextStyle(
      color: AppColors.HINT_COLOR,
      fontSize: 12
  );


  static const TextStyle SLIDE_BUTTONS_STYLE = TextStyle(
    fontSize: 18,
    color: AppColors.RED,
    fontWeight: FontWeight.w600
  );

  static const TextStyle TITLE_STYLE = TextStyle(
      fontSize: 29,
      fontWeight: FontWeight.w600,
      color: AppColors.TEXT
  );

  static const TextStyle SCORE_STYLE = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.TEXT
  );

  static const TextStyle SUBTITLE_STYLE = TextStyle(
      fontSize: 16,
      color: AppColors.HINT_COLOR
  );

  static const TextStyle DETAILS_LABEL_STYLE = TextStyle(
      color: AppColors.TEXT,
      fontWeight: FontWeight.w600,
      fontSize: 16
  );

  static const TextStyle DETAILS_VALUE_STYLE = TextStyle(
      color: AppColors.TEXT,
      fontSize: 16
  );
}