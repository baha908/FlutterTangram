import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tangram/bloc/level/level_bloc.dart';
import 'package:flutter_tangram/data/shapes.dart';
import 'package:flutter_tangram/model/shape.dart';

class TargetWidget extends StatelessWidget {
  final Shape shape;
  const TargetWidget({
    Key? key,
    required this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LevelBloc, LevelState>(
      builder: (context, state) {
        return Positioned(
          top: shape.targetPosition.x,
          left: shape.targetPosition.y,
          child: DragTarget<Shape>(
            builder: (context, candidateData, rejectedData) =>
                RotationTransition(
              turns: AlwaysStoppedAnimation(shape.rotationAngle),
              child: ClipPath(
                child: Container(
                  color: Color(shape.targetColor),
                  width: shape.width,
                  height: shape.height,
                ),
                clipper: shapesToCustomClipper(shape.shape),
              ),
            ),
            onWillAccept: (data) {
              return true;
            },
            onAccept: (data) {
              if (data.id == shape.id) {
                context.read<LevelBloc>().add(ShapePlaced(shapeId: data.id));
              }
            },
          ),
        );
      },
    );
  }
}
