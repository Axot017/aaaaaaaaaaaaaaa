import 'package:aaaaaaaaaaaaaaa/styles/colors.dart';
import 'package:flutter/material.dart';

class GradientRaisedButton extends StatelessWidget {
  final void Function() onClick;
  final String text;

  GradientRaisedButton({this.text, this.onClick});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textColor: Colors.white,
      onPressed: onClick,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration: const BoxDecoration(
          gradient: AppColors.FLOATING_BUTTON_GRADIENT,
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: Container(
          constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }

}