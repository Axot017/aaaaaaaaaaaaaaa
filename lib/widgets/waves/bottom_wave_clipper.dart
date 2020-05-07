import 'package:flutter/material.dart';

class BottomWaveClipper extends CustomClipper<Path> {
  const BottomWaveClipper();

  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0.0, size.height)
      ..quadraticBezierTo(size.width * 0.05, size.height * 0.8333, size.width * 0.33, size.height * 0.78)
      ..quadraticBezierTo(size.width * 0.875, size.height * 0.69, size.width * 0.94, size.height * 0.1)
      ..quadraticBezierTo(size.width * 0.95, 0.0, size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}