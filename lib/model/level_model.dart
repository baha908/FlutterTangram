import 'package:flutter_tangram/model/shape_model.dart';

class LevelModel {
  final List<ShapeModel> shapes;
  LevelModel(this.shapes);
  int score = 0;
  bool get isGameOver => score == shapes.length;
}
