import 'package:flutter/material.dart';

class PostCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0.0, 100.0);
    path.lineTo(0.0, size.height - 36.0);
    path.quadraticBezierTo(0, size.height, 36.0, size.height);
    path.lineTo(size.width - 36.0, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 36.0);
    path.lineTo(size.width, 36.0);
    path.quadraticBezierTo(size.width, 0.0, size.width - 36.0, 0.0);
    path.lineTo(125.0, 0.0);
    path.quadraticBezierTo(100.0, 0.0, 100.0, 25.0);
    path.lineTo(100.0, 50.0);
    path.quadraticBezierTo(100.0, 75.0, 75.0, 75.0);
    path.lineTo(25.0, 75.0);
    path.quadraticBezierTo(0.0, 75.0, 0.0, 100.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
