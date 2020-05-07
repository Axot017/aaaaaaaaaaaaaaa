import 'package:aaaaaaaaaaaaaaa/widgets/waves/bottom_wave.dart';
import 'package:aaaaaaaaaaaaaaa/widgets/waves/top_wave.dart';
import 'package:flutter/material.dart';

class WavyBackground extends StatelessWidget {
  final Widget child;

  WavyBackground({this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              child: TopWave(),
            ),
            Positioned(
              bottom: 0,
              child: BottomWave(),
            ),
            child
          ],
        ),
      ),
    );
  }
}