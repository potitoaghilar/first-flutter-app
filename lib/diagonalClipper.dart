import 'package:flutter/material.dart';

class DiagonalClipper extends CustomClipper<Path> {

  double _fade = .5, _minHeight, _maxHeight;
  DiagonalClipper(this._minHeight, this._maxHeight, this._fade);

  @override
  Path getClip(Size size) {

    var height = lerpDouble(_minHeight, _maxHeight, _fade);
    var cut = lerpDouble(60, 0, _fade);

    Path path = new Path();
    path.lineTo(0.0, height - cut);
    path.lineTo(size.width, height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  double lerpDouble(num a, num b, double t) {
    if (a == null && b == null)
      return null;
    a ??= 0.0;
    b ??= 0.0;
    return a + (b - a) * t;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}