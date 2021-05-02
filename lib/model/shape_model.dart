import 'dart:math';

import 'package:flutter/material.dart';

class ShapeModel {
  final Point targetPosition;
  final Point position;
  final Color color;
  final CustomClipper shape;
  final double rotationAngle;

  ShapeModel({
    @required this.targetPosition,
    @required this.position,
    @required this.color,
    @required this.shape,
    @required this.rotationAngle,
  });
}
