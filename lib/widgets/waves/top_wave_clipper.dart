import 'package:flutter/material.dart';

class TopWaveClipper extends CustomClipper<Path> {
  const TopWaveClipper();

  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(size.width, 0.0)
      ..quadraticBezierTo(size.width * 0.95, size.height * 0.1667, size.width * 0.67, size.height * 0.22)
      ..quadraticBezierTo(size.width * 0.125, size.height * 0.31, size.width * 0.06, size.height * 0.9)
      ..quadraticBezierTo(size.width * 0.05, size.height, 0.0, size.height)
      ..lineTo(0.0, 0.0)
      ..lineTo(size.width, 0.0)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}