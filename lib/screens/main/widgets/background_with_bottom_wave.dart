import 'package:aaaaaaaaaaaaaaa/styles/animation_info.dart';
import 'package:aaaaaaaaaaaaaaa/widgets/buttons/floating_gradient_icon_button.dart';
import 'package:aaaaaaaaaaaaaaa/widgets/waves/bottom_wave.dart';
import 'package:flutter/material.dart';

class BackgroundWithFab extends StatelessWidget {
  final Widget child;
  final void Function() onFabClick;
  final bool isFabVisible;

  BackgroundWithFab({this.child, this.onFabClick, this.isFabVisible: true});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: BottomWave(),
        ),
        Positioned(
          bottom: 0,
          top: 0,
          right: 0,
          left: 0,
          child: child,
        ),
        AnimatedPositioned(
          duration: AppAnimationInfo.LOGIN_ANIMATION_DURATION,
          curve: AppAnimationInfo.LOGIN_ANIMATION_CURVE,
          bottom: isFabVisible ? 32 : -64,
          left: 16,
          child: FloatingGradientIconButton(
            icon: Icons.add,
            onClick: onFabClick,
          ),
        )
      ],
    );
  }

}