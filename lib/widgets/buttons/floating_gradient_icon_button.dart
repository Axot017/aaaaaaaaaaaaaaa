import 'package:aaaaaaaaaaaaaaa/styles/colors.dart';
import 'package:aaaaaaaaaaaaaaa/styles/shadows.dart';
import 'package:flutter/material.dart';

class FloatingGradientIconButton extends StatelessWidget {
  final void Function() onClick;
  final IconData icon;
  final Gradient gradient;

  FloatingGradientIconButton({
    this.icon,
    this.onClick,
    this.gradient: AppColors.FLOATING_BUTTON_GRADIENT
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: AppShadows.FLOATING_BUTTON_SHADOW,
        gradient: gradient,
        shape: BoxShape.circle,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onClick,
          splashColor: AppColors.GREEN,
          customBorder: CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              icon,
              size: 21,
              color: AppColors.WHITE,
            ),
          ),
        ),
      ),
    );
  }
}