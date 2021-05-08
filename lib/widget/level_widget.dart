import 'package:flutter/material.dart';
import 'package:flutter_tangram/data/levels.dart';
import 'package:flutter_tangram/widget/shape_widget.dart';
import 'package:flutter_tangram/widget/target_widget.dart';

class LevelWidget extends StatelessWidget {
  final levels = Levels();
  LevelWidget({
    Key key,
    @required level,
  }) : super(key: key) {
    levels.currentLevel = level;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Stack(children: [
          ...levels.getLevel().shapes.map((e) => TargetWidget(
                shapeModel: e,
                levels: levels,
              )),
          ...levels.getLevel().shapes.map((e) => ShapeWidget(shapeModel: e)),
        ]),
      ),
    );
  }
}
