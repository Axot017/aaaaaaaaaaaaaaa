import 'package:aaaaaaaaaaaaaaa/styles/colors.dart';
import 'package:aaaaaaaaaaaaaaa/styles/shadows.dart';
import 'package:aaaaaaaaaaaaaaa/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideFloatingButton extends StatelessWidget {
  final bool rightSide;
  final String text;
  final double width;
  final void Function() onClick;

  SideFloatingButton({this.onClick, this.rightSide: false, this.text, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: !rightSide ? Alignment.centerRight : Alignment.centerLeft,
      width: width,
      decoration: _decoration,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: _borderRadius,
          onTap: onClick,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Text(text,
              style: AppTextStyles.SLIDE_BUTTONS_STYLE,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration get _decoration => BoxDecoration(
      color: AppColors.WHITE,
      boxShadow: AppShadows.CARD_SHADOW,
      borderRadius: _borderRadius
  );

  BorderRadius get _borderRadius => BorderRadius.only(
    topRight: Radius.circular(rightSide ? 0 : 2137),
    bottomRight: Radius.circular(rightSide ? 0 : 2137),
    topLeft: Radius.circular(rightSide ? 2137 : 0),
    bottomLeft: Radius.circular(rightSide ? 2137 : 0),
  );

}