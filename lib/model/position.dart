import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'position.g.dart';

@JsonSerializable()
class Position extends Equatable {
  final double x;
  final double y;
  const Position(this.x, this.y);

  @override
  List<Object?> get props => [x, y];

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
  Map<String, dynamic> toJson() => _$PositionToJson(this);
}
