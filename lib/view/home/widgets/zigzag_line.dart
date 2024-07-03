import 'package:flutter/material.dart';
class ZigzagClipper extends CustomClipper<Path> {
  final double amplitude;
  final double wavelength;

  ZigzagClipper({
    this.amplitude = 10.0,
    this.wavelength = 20.0,
  });

  @override
  Path getClip(Size size) {
    final path = Path();
    for (double y = 0; y < size.height; y += wavelength) {
      path.relativeLineTo(amplitude, wavelength / 2);
      path.relativeLineTo(-amplitude, wavelength / 2);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
