import 'package:flutter_tangram/model/shape_model.dart';
import 'package:flutter/material.dart';

class TargetWidget extends StatefulWidget {
  final ShapeModel shapeModel;
  const TargetWidget({
    Key key,
    @required this.shapeModel,
  }) : super(key: key);

  @override
  _TargetWidgetState createState() => _TargetWidgetState();
}

class _TargetWidgetState extends State<TargetWidget> {
  @override
  Widget build(BuildContext context) {
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
          print(data);
          return true;
        },
        onAccept: (data) {
          setState(() {
            data.isPlaced = true;
            data.targetColor = data.color;
          });
        },
      ),
    );
  }
}
