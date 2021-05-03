import 'package:flutter_tangram/model/shape_model.dart';
import 'package:flutter/material.dart';

class TargetWidget extends StatelessWidget {
  final ShapeModel shapeModel;
  const TargetWidget({
    Key key,
    @required this.shapeModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: shapeModel.targetPosition.x,
      left: shapeModel.targetPosition.y,
      child: DragTarget<ShapeModel>(
        builder: (context, candidateData, rejectedData) => RotationTransition(
          turns: AlwaysStoppedAnimation(shapeModel.rotationAngle),
          child: ClipPath(
            child: Container(
              color: shapeModel.targetColor,
              width: shapeModel.width,
              height: shapeModel.height,
            ),
            clipper: shapeModel.shape,
          ),
        ),
        onWillAccept: (data) => true,
        onAccept: (data) {
          data.isPlaced = false;
        },
      ),
    );
  }
}
