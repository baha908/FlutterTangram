// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shape.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shape _$ShapeFromJson(Map<String, dynamic> json) {
  return Shape(
    isPlaced: json['isPlaced'] as bool,
    height: (json['height'] as num).toDouble(),
    width: (json['width'] as num).toDouble(),
    id: json['id'] as int,
    targetPosition:
        Position.fromJson(json['targetPosition'] as Map<String, dynamic>),
    position: Position.fromJson(json['position'] as Map<String, dynamic>),
    color: json['color'] as int,
    targetColor: json['targetColor'] as int,
    shape: json['shape'] as String,
    rotationAngle: (json['rotationAngle'] as num).toDouble(),
  );
}

Map<String, dynamic> _$ShapeToJson(Shape instance) => <String, dynamic>{
      'isPlaced': instance.isPlaced,
      'id': instance.id,
      'height': instance.height,
      'width': instance.width,
      'targetPosition': instance.targetPosition,
      'position': instance.position,
      'color': instance.color,
      'targetColor': instance.targetColor,
      'shape': instance.shape,
      'rotationAngle': instance.rotationAngle,
    };
