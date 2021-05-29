// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Position _$PositionFromJson(Map<String, dynamic> json) {
  return Position(
    (json['x'] as num).toDouble(),
    (json['y'] as num).toDouble(),
  );
}

Map<String, dynamic> _$PositionToJson(Position instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };
