import 'package:flutter_tangram/data/levels.dart';
import 'package:flutter_tangram/model/shape_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tangram/pages/low_level_page.dart';

class TargetWidget extends StatefulWidget {
  final ShapeModel shapeModel;
  final Levels levels;
  const TargetWidget({
    Key key,
    @required this.shapeModel,
    @required this.levels,
  }) : super(key: key);

  @override
  _TargetWidgetState createState() => _TargetWidgetState();
}

class _TargetWidgetState extends State<TargetWidget> {
  @override
  Widget build(BuildContext context) {
    print(widget.levels.currentLevel);
    return Positioned(
      top: widget.shapeModel.targetPosition.x,
      left: widget.shapeModel.targetPosition.y,
      child: DragTarget<ShapeModel>(
        builder: (context, candidateData, rejectedData) => RotationTransition(
          turns: AlwaysStoppedAnimation(widget.shapeModel.rotationAngle),
          child: ClipPath(
            child: Container(
              color: widget.shapeModel.targetColor,
              width: widget.shapeModel.width,
              height: widget.shapeModel.height,
            ),
            clipper: widget.shapeModel.shape,
          ),
        ),
        onWillAccept: (data) {
          return true;
        },
        onAccept: (data) {
          if (data.id == widget.shapeModel.id) {
            setState(() {
              widget.levels.getLevel().score += 1;
              data.isPlaced = true;
              data.targetColor = data.color;
            });
          }
          if (widget.levels.getLevel().isGameOver) {
            setState(() {});
          }
        },
      ),
    );
  }
}
