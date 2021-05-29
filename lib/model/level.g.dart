// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Level _$LevelFromJson(Map<String, dynamic> json) {
  return Level(
    shapes: (json['shapes'] as List<dynamic>)
        .map((e) => Shape.fromJson(e as Map<String, dynamic>))
        .toList(),
    levelNo: json['levelNo'] as int,
    difficulty: json['difficulty'] as int,
  );
}

Map<String, dynamic> _$LevelToJson(Level instance) => <String, dynamic>{
      'shapes': instance.shapes,
      'levelNo': instance.levelNo,
      'difficulty': instance.difficulty,
    };
