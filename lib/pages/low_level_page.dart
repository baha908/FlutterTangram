import 'package:flutter/material.dart';
import 'package:flutter_tangram/data/levels.dart';
import 'package:flutter_tangram/model/shape_model.dart';
import 'package:flutter_tangram/widget/shape_widget.dart';
import 'package:flutter_tangram/widget/target_widget.dart';

class LowLevelPage extends StatefulWidget {
  static const routeName = '/low_level_page';

  final List<ShapeModel> level = Levels().levels[0].shapes;
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
            ...widget.level.map((e) => TargetWidget(shapeModel: e)),
            ...widget.level.map((e) => ShapeWidget(shapeModel: e)),
          ]),
        ),
      ),
    );
  }
}
