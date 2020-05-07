import 'package:aaaaaaaaaaaaaaa/screens/auth/widgets/auth_form_text_field.dart';
import 'package:aaaaaaaaaaaaaaa/screens/auth/widgets/slide_in_form.dart';
import 'package:aaaaaaaaaaaaaaa/styles/animation_info.dart';
import 'package:flutter/material.dart';

class RegisterWidget extends StatefulWidget {
  final bool isVisible;
  final void Function(String email, String password, String repeatPassword) onRegister;

  RegisterWidget({this.isVisible, this.onRegister});

  @override
  State<StatefulWidget> createState() {
    return _RegisterWidgetState();
  }
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _repeatPasswordFocusNode = FocusNode();

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
                focusNode: _emailFocusNode,
                hint: "Email",
                controller: _emailController,
                onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordFocusNode),
              ),
              AuthFormTextField(
                obscureText: true,
                hint: "Password",
                icon: Icons.lock,
                focusNode: _passwordFocusNode,
                controller: _passwordController,
                onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_repeatPasswordFocusNode),
              ),
              AuthFormTextField(
                obscureText: true,
                hint: "Repeat password",
                icon: Icons.lock_outline,
                focusNode: _repeatPasswordFocusNode,
                controller: _repeatPasswordController,
                onFieldSubmitted: (_) => onSubmit(),
              ),
            ],
            buttonIcon: Icons.done,
            onClick: onSubmit,
          ),
        ),
      ),
    );
  }

  void onSubmit() {
    FocusScope.of(context).unfocus();
    widget.onRegister(_emailController.text, _passwordController.text, _repeatPasswordController.text);
  }
}