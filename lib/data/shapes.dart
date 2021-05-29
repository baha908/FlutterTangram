import 'package:flutter/material.dart';

CustomClipper<Path> shapesToCustomClipper(String shape) {
  switch (shape) {
    case "Triangle":
      return Triangle();
    case "Square":
      return Triangle();
    case "Paralelogram":
      return Paralelogram();
    case "FlipParalelogram":
      return Paralelogram(flip: true);
    default:
      throw Exception('Error');
  }
}

class Triangle extends CustomClipper<Path> {
  const Triangle();
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class Square extends CustomClipper<Path> {
  const Square();
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class Paralelogram extends CustomClipper<Path> {
  final bool flip;
  const Paralelogram({this.flip = false});
  @override
  Path getClip(Size size) {
    return (flip)
        ? (Path()
          ..moveTo(0, 0)
          ..lineTo(size.width - size.height, 0)
          ..lineTo(size.width, size.height)
          ..lineTo(size.height, size.height)
          ..close())
        : (Path()
          ..moveTo(size.height, 0)
          ..lineTo(size.width, 0)
          ..lineTo(size.width - size.height, size.height)
          ..lineTo(0, size.height)
          ..close());
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
