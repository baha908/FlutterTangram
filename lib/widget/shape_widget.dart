import 'package:flutter_tangram/model/shape_model.dart';
import 'package:flutter/material.dart';

class Shape extends StatelessWidget {
  final ShapeModel shapeModel;
  const Shape({
    Key key,
    this.shapeModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: shapeModel.position.x,
      left: shapeModel.position.y,
      child: Draggable(
        feedback: RotationTransition(
          turns: AlwaysStoppedAnimation(shapeModel.rotationAngle),
          child: ClipPath(
            child: Container(
              color: shapeModel.color,
              width: 250,
              height: 250,
            ),
            clipper: shapeModel.shape,
          ),
        ),
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(shapeModel.rotationAngle),
          child: ClipPath(
            child: Container(
              color: shapeModel.color,
              width: 250,
              height: 250,
            ),
            clipper: shapeModel.shape,
          ),
        ),
        childWhenDragging: Container(),
      ),
    );
  }
}
