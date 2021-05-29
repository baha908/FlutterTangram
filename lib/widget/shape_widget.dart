import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tangram/bloc/level/level_bloc.dart';
import 'package:flutter_tangram/data/shapes.dart';
import 'package:flutter_tangram/model/position.dart';
import 'package:flutter_tangram/model/shape.dart';

class ShapeWidget extends StatefulWidget {
  final Shape shape;
  const ShapeWidget({
    Key? key,
    required this.shape,
  }) : super(key: key);

  @override
  _ShapeWidgetState createState() => _ShapeWidgetState();
}

class _ShapeWidgetState extends State<ShapeWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LevelBloc, LevelState>(
      builder: (context, state) {
        return (widget.shape.isPlaced)
            ? Container()
            : Positioned(
                top: widget.shape.position.y,
                left: widget.shape.position.x,
                child: Draggable(
                  feedback: RotationTransition(
                    turns: AlwaysStoppedAnimation(widget.shape.rotationAngle),
                    child: ClipPath(
                      child: Container(
                        color: Color(widget.shape.color),
                        width: widget.shape.width,
                        height: widget.shape.height,
                      ),
                      clipper: shapesToCustomClipper(widget.shape.shape),
                    ),
                  ),
                  data: widget.shape,
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(widget.shape.rotationAngle),
                    child: ClipPath(
                      child: Container(
                        color: Color(widget.shape.color),
                        width: widget.shape.width,
                        height: widget.shape.height,
                      ),
                      clipper: shapesToCustomClipper(widget.shape.shape),
                    ),
                  ),
                  childWhenDragging: Container(),
                  onDragEnd: (DraggableDetails d) {
                    context.read<LevelBloc>().add(ShapeMoved(
                        position: Position(d.offset.dx, d.offset.dy),
                        shapeId: widget.shape.id));
                  },
                ),
              );
      },
    );
  }
}
