import 'package:aaaaaaaaaaaaaaa/styles/colors.dart';
import 'package:flutter/material.dart';

class FadeIcon extends StatelessWidget {
  final IconData icon;
  final double iconSize;

  FadeIcon({this.iconSize, this.icon, Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: iconSize,
      height: double.infinity,
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Icon(icon, size: iconSize, color: AppColors.ORANGE,),
          Container(
            alignment: Alignment.center,
            width: iconSize,
            height: iconSize,
            decoration: BoxDecoration(
              gradient: AppColors.FADE_GRADIENT
            ),
          )
        ],
      ),
    );
  }

}