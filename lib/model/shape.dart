import 'package:equatable/equatable.dart';
import 'package:flutter_tangram/model/position.dart';
import 'package:json_annotation/json_annotation.dart';
part 'shape.g.dart';

@JsonSerializable()
class Shape extends Equatable {
  final bool isPlaced;
  final int id;
  final double height;
  final double width;
  final Position targetPosition;
  final Position position;
  final int color;
  final int targetColor;
  final String shape;
  final double rotationAngle;

  const Shape({
    this.isPlaced = false,
    this.height = 100,
    this.width = 100,
    this.id = 0,
    this.targetPosition = const Position(0, 0),
    this.position = const Position(0, 0),
    this.color = 0xFFFFFFFF,
    this.targetColor = 0xFF000000,
    this.shape = "Triangle",
    this.rotationAngle = 0,
  });

  Shape copyWith({
    bool? isPlaced,
    int? id,
    double? height,
    double? width,
    Position? targetPosition,
    Position? position,
    int? color,
    int? targetColor,
    String? shape,
    double? rotationAngle,
  }) {
    return Shape(
      isPlaced: isPlaced ?? this.isPlaced,
      id: id ?? this.id,
      height: height ?? this.height,
      width: width ?? this.width,
      targetPosition: targetPosition ?? this.targetPosition,
      position: position ?? this.position,
      color: color ?? this.color,
      targetColor: targetColor ?? this.targetColor,
      shape: shape ?? this.shape,
      rotationAngle: rotationAngle ?? this.rotationAngle,
    );
  }

  @override
  List<Object?> get props => [
        isPlaced,
        id,
        height,
        width,
        targetPosition,
        position,
        color,
        targetColor,
        shape,
        rotationAngle,
      ];

  factory Shape.fromJson(Map<String, dynamic> json) => _$ShapeFromJson(json);
  Map<String, dynamic> toJson() => _$ShapeToJson(this);
}
