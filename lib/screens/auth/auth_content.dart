import 'dart:async';

import 'package:aaaaaaaaaaaaaaa/blocs/auth_bloc.dart';
import 'package:aaaaaaaaaaaaaaa/enums/auth_screen_state.dart';
import 'package:aaaaaaaaaaaaaaa/injection/app_module.dart';
import 'package:aaaaaaaaaaaaaaa/screens/auth/widgets/auth_screen_title.dart';
import 'package:aaaaaaaaaaaaaaa/screens/auth/widgets/login_widget.dart';
import 'package:aaaaaaaaaaaaaaa/screens/auth/widgets/register_widget.dart';
import 'package:aaaaaaaaaaaaaaa/screens/main/main_screen.dart';
import 'package:aaaaaaaaaaaaaaa/styles/animation_info.dart';
import 'package:aaaaaaaaaaaaaaa/utils/auth_error_handler.dart';
import 'package:aaaaaaaaaaaaaaa/utils/toast_util.dart';
import 'package:aaaaaaaaaaaaaaa/widgets/buttons/side_floating_button.dart';
import 'package:aaaaaaaaaaaaaaa/widgets/waves/wavy_background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthContent extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => AuthContentState();

}

class AuthContentState extends State<AuthContent> {
  static const _SIDE_BUTTON_WIDTH = 150.0;

  AuthBloc _authBloc;
  StreamSubscription _currentUserSubscription;
  AuthScreenState _screenState = AuthScreenState.LOGIN;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _authBloc = AppModule.injector.getBloc();
    _currentUserSubscription = _authBloc.currentUserStream
        .listen(_onCurrentUserChanged, onError: _onLoginError);
    _authBloc.tryAutoLogin();
  }

  @override
  Widget build(BuildContext context) {
    return WavyBackground(
      child: SizedBox.expand(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Visibility(
                visible: _isLoading,
                child: CircularProgressIndicator(),
              ),
            ),
            LoginWidget(
              isVisible: _screenState == AuthScreenState.LOGIN && !_isLoading,
              onLogin: _signIn,
            ),
            RegisterWidget(
              isVisible: _screenState == AuthScreenState.REGISTER && !_isLoading,
              onRegister: _signUp,
            ),
            _loginButton,
            _registerButton,
            Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              left: 0,
              right: 0,
              child: AuthScreenTitle(_screenState, _isLoading),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _currentUserSubscription?.cancel();
  }

  Widget get _registerButton => AnimatedPositioned(
    duration: AppAnimationInfo.LOGIN_ANIMATION_DURATION,
    left: _isLoginState && !_isLoading ? 0 : -_SIDE_BUTTON_WIDTH,
    curve: AppAnimationInfo.LOGIN_ANIMATION_CURVE,
    bottom: MediaQuery.of(context).size.height * 0.15,
    child: SideFloatingButton(
      width: _SIDE_BUTTON_WIDTH,
      onClick: () => _changeScreenType(AuthScreenState.REGISTER),
      text: 'Register',
    ),
  );

  Widget get _loginButton => AnimatedPositioned(
    duration: AppAnimationInfo.LOGIN_ANIMATION_DURATION,
    right: !_isLoginState && !_isLoading ? 0 : -_SIDE_BUTTON_WIDTH,
    curve: AppAnimationInfo.LOGIN_ANIMATION_CURVE,
    top: MediaQuery.of(context).size.height * 0.15,
    child: SideFloatingButton(
      width: _SIDE_BUTTON_WIDTH,
      rightSide: true,
      onClick: () => _changeScreenType(AuthScreenState.LOGIN),
      text: 'Login',
    ),
  );

  void _signIn(String email, String password) {
    if (validateLogin(email, password)) {
      _changeLoadingState(true);
      _authBloc.signIn(email, password);
    }
  }

  void _signUp(String email, String password, String repeatPassword) {
    if (validateRegistration(email, password, repeatPassword)) {
      _changeLoadingState(true);
      _authBloc.signUp(email, password);
    }
  }

  void _changeScreenType(AuthScreenState state) {
    if(_screenState == state) return;
    setState(() {
      _screenState = state;
    });
  }

  bool get _isLoginState => _screenState == AuthScreenState.LOGIN;

  void _onCurrentUserChanged(FirebaseUser user) {
    Future.delayed(const Duration(seconds: 1), () {
      if (user != null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainScreen()));
      } else {
        _changeLoadingState(false);
      }
    });
  }

  void _onLoginError(_) {
    showErrorToast('Failed to ${_screenState == AuthScreenState.LOGIN ? 'login' : 'register'}');
    _changeLoadingState(false);
  }

  void _changeLoadingState(bool isLoading) {
    if(_isLoading == isLoading) return;
    setState(() {
      _isLoading = isLoading;
    });
  }
}