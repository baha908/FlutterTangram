import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tangram/model/position_model.dart';
import 'package:flutter_tangram/model/shape_model.dart';
import 'package:flutter_tangram/model/shapes.dart';
import 'package:flutter_tangram/widget/shape_widget.dart';
import 'package:flutter_tangram/widget/target_widget.dart';

class LowLevelPage extends StatefulWidget {
  static const routeName = '/low_level_page';

  final List<ShapeModel> shapes = [
    ShapeModel(
      id: 1,
      height: 500,
      width: 500,
      targetPosition: PositionModel(250, 250),
      position: PositionModel(25, 25),
      color: Colors.red,
      targetColor: Colors.yellow,
      shape: Triangle(),
      rotationAngle: 90 / 360,
    ),
    ShapeModel(
      id: 2,
      height: 250,
      width: 250,
      targetPosition: PositionModel(250, 250),
      position: PositionModel(250, 250),
      color: Colors.red,
      targetColor: Colors.yellow,
      shape: Triangle(),
      rotationAngle: 90 / 360,
    ),
  ];
  @override
  _LowLevelPageState createState() => _LowLevelPageState();
}

class _LowLevelPageState extends State<LowLevelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Low'),
      ),
      body: Center(
        child: Container(
          child: Stack(children: [
            ShapeWidget(shapeModel: widget.shapes[0]),
            TargetWidget(shapeModel: widget.shapes[0]),
          ]),
        ),
      ),
    );
  }
}
