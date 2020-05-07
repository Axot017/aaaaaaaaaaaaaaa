import 'package:aaaaaaaaaaaaaaa/styles/animation_info.dart';
import 'package:aaaaaaaaaaaaaaa/widgets/icons/fade_icon.dart';
import 'package:flutter/material.dart';

class AnimatedIconsSwitcher extends StatelessWidget {
  final IconData icon;
  final double iconSize;

  AnimatedIconsSwitcher({this.iconSize, this.icon});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: AppAnimationInfo.LOGIN_ANIMATION_DURATION,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      switchInCurve: Curves.easeInOutBack,
      switchOutCurve: Curves.easeInOutBack,
      child: FadeIcon(
        key: ValueKey<int>(icon.codePoint),
        icon: icon,
        iconSize: iconSize,
      ),
    );
  }

}