import 'package:aaaaaaaaaaaaaaa/screens/auth/widgets/auth_form_text_field.dart';
import 'package:aaaaaaaaaaaaaaa/screens/auth/widgets/slide_in_form.dart';
import 'package:aaaaaaaaaaaaaaa/styles/animation_info.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  final bool isVisible;
  final void Function(String email, String password) onLogin;

  LoginWidget({this.isVisible, this.onLogin});

  @override
  State<StatefulWidget> createState() => _LoginWidgetState();


}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: widget.isVisible ? 0 : -MediaQuery.of(context).size.width,
      duration: AppAnimationInfo.LOGIN_ANIMATION_DURATION,
      curve: AppAnimationInfo.LOGIN_ANIMATION_CURVE,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          alignment: Alignment.center,
          child: SlideInForm(
            textFields: [
              AuthFormTextField(
                icon: Icons.email,
                hint: "Email",
                controller: _emailController,
                focusNode: _emailFocusNode,
                onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordFocusNode),
              ),
              AuthFormTextField(
                obscureText: true,
                hint: "Password",
                icon: Icons.lock,
                focusNode: _passwordFocusNode,
                controller: _passwordController,
                onFieldSubmitted: (_) => onSubmit(),
              ),
            ],
            buttonIcon: Icons.arrow_forward,
            onClick: onSubmit,
          ),
        ),
      ),
    );
  }

  void onSubmit() {
    FocusScope.of(context).unfocus();
    widget.onLogin(_emailController.text, _passwordController.text);
  }
}