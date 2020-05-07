import 'package:aaaaaaaaaaaaaaa/styles/colors.dart';
import 'package:aaaaaaaaaaaaaaa/widgets/waves/top_wave_clipper.dart';
import 'package:flutter/material.dart';

class TopWave extends StatelessWidget {
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
    left: -7,
    top: -7,
    child: ClipPath(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      clipper: const TopWaveClipper(),
      child: Container(
        height: MediaQuery.of(context).size.longestSide * 0.3,
        width: MediaQuery.of(context).size.shortestSide * 0.9,
        decoration: BoxDecoration(
            gradient: AppColors.TOP_WAVE_GRADIENT
        ),
      ),
    ),
  );

  Widget _getShadowWave(context) => Positioned(
    left: 0,
    top: 0,
    child: ClipPath(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      clipper: const TopWaveClipper(),
      child: Container(
        height: MediaQuery.of(context).size.longestSide * 0.3,
        width: MediaQuery.of(context).size.shortestSide * 0.9,
        decoration: BoxDecoration(
            color: AppColors.RED.withOpacity(0.1)
        ),
      ),
    ),
  );
}