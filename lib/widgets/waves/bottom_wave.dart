import 'package:aaaaaaaaaaaaaaa/styles/colors.dart';
import 'package:aaaaaaaaaaaaaaa/widgets/waves/bottom_wave_clipper.dart';
import 'package:flutter/material.dart';

class BottomWave extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.longestSide * 0.35,
      width: MediaQuery.of(context).size.shortestSide,
      child: Stack(
        children: <Widget>[
          _getShadowWave(context),
          _getMainWave(context)
        ],
      ),
    );
  }

  Widget _getMainWave(context) => Positioned(
    right: -7,
    bottom: -7,
    child: ClipPath(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      clipper: const BottomWaveClipper(),
      child: Container(
        height: MediaQuery.of(context).size.longestSide * 0.3,
        width: MediaQuery.of(context).size.shortestSide * 0.9,
        decoration: BoxDecoration(
            gradient: AppColors.BOTTOM_WAVE_GRADIENT
        ),
      ),
    ),
  );

  Widget _getShadowWave(context) => Positioned(
    right: 0,
    bottom: 0,
    child: ClipPath(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      clipper: const BottomWaveClipper(),
      child: Container(
        height: MediaQuery.of(context).size.longestSide * 0.3,
        width: MediaQuery.of(context).size.shortestSide * 0.9,
        decoration: BoxDecoration(
          color: AppColors.BLUE.withOpacity(0.1)
        ),
      ),
    ),
  );

}