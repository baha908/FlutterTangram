import 'package:equatable/equatable.dart';
import 'package:flutter_tangram/model/shape.dart';
import 'package:json_annotation/json_annotation.dart';

part 'level.g.dart';

@JsonSerializable()
class Level extends Equatable {
  final List<Shape> shapes;
  final int levelNo;
  final int difficulty;

  const Level({
    required this.shapes,
    required this.levelNo,
    required this.difficulty,
  });

  @override
  List<Object?> get props => [shapes, levelNo, difficulty];

  Level copyWith({
    List<Shape>? shapes,
    int? levelNo,
    int? difficulty,
  }) {
    return Level(
      shapes: shapes ?? this.shapes,
      levelNo: levelNo ?? this.levelNo,
      difficulty: difficulty ?? this.difficulty,
    );
  }

  factory Level.fromJson(Map<String, dynamic> json) => _$LevelFromJson(json);
  Map<String, dynamic> toJson() => _$LevelToJson(this);
}
