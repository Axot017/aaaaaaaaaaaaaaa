import 'package:aaaaaaaaaaaaaaa/enums/auth_screen_state.dart';
import 'package:aaaaaaaaaaaaaaa/styles/animation_info.dart';
import 'package:aaaaaaaaaaaaaaa/styles/text_styles.dart';
import 'package:flutter/material.dart';

class AuthScreenTitle extends StatelessWidget {
  final AuthScreenState _screenState;
  final isLoading;

  AuthScreenTitle(this._screenState, this.isLoading);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: AppAnimationInfo.LOGIN_ANIMATION_DURATION,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return RotationTransition(
          turns: animation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      switchInCurve: Curves.easeInOutBack,
      switchOutCurve: Curves.easeInOutBack,
      child: Text(_stringBasedOnState,
        key: ValueKey<String>(_stringBasedOnState),
        textAlign: TextAlign.center,
        style: AppTextStyles.TITLE_STYLE,
      ),
    );
  }

  String get _stringBasedOnState {
   if (isLoading) {
     return 'Loading ...';
   } else {
     return _screenState == AuthScreenState.LOGIN ? 'Login' : 'Register';
   }
  }
}