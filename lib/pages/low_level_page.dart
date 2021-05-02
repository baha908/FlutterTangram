import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tangram/model/shape_model.dart';
import 'package:flutter_tangram/model/shapes.dart';
import 'package:flutter_tangram/widget/shape_widget.dart';

class LowLevelPage extends StatelessWidget {
  static const routeName = '/low_level_page';

  @override
  Widget build(BuildContext context) {
    List<ShapeModel> shapes = [
      ShapeModel(
        targetPosition: Point(250, 250),
        position: Point(25, 25),
        color: Colors.red,
        shape: Triangle(),
        rotationAngle: 60 / 360,
      ),
      ShapeModel(
        targetPosition: Point(250, 250),
        position: Point(250, 250),
        color: Colors.red,
        shape: Triangle(),
        rotationAngle: 90 / 360,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Low'),
      ),
      body: Center(
        child: Container(
          child: Stack(children: [
            Shape(shapeModel: shapes[0]),
            Shape(shapeModel: shapes[1]),
          ]),
        ),
      ),
    );
  }
}
