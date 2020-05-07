import 'package:aaaaaaaaaaaaaaa/styles/colors.dart';
import 'package:flutter/material.dart';

class AuthFormTextField extends StatelessWidget {
  final void Function(String) onChange;
  final void Function(String) onFieldSubmitted;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool obscureText;
  final IconData icon;
  final String hint;

  AuthFormTextField({
    this.icon,
    this.focusNode,
    this.controller,
    this.onChange,
    this.onFieldSubmitted,
    this.obscureText: false,
    this.hint
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChange,
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(
        color: AppColors.HINT_COLOR,
        fontSize: 18
      ),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(24, 16, 24, 16),
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.HINT_COLOR.withOpacity(0.5)
        ),
        border: InputBorder.none,
        prefixIcon: Icon(
          icon,
          color: AppColors.HINT_COLOR,
        ),
      ),
    );
  }
}