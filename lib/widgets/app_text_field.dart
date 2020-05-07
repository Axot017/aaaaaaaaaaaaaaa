import 'package:aaaaaaaaaaaaaaa/styles/colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onChanged;
  final void Function(String) onSubmitted;
  final String label;
  final FocusNode focusNode;

  AppTextField({
    this.label,
    this.focusNode,
    this.onSubmitted,
    this.onChanged,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: AppColors.ORANGE),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        focusNode: focusNode,
        cursorColor: AppColors.ORANGE,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                  color: AppColors.ORANGE,
                  width: 1
              )
          ),
        )
      ),
    );
  }

}