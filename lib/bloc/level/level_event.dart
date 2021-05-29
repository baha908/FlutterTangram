part of 'level_bloc.dart';

abstract class LevelEvent extends Equatable {
  const LevelEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends LevelEvent {}

class GetLevel extends LevelEvent {
  final int levelNo;
  GetLevel({required this.levelNo});
  @override
  List<Object> get props => [levelNo];
}

class GetNextLevel extends LevelEvent {}

class ShapeMoved extends LevelEvent {
  final Position position;
  final int shapeId;
  ShapeMoved({required this.position, required this.shapeId});

  @override
  List<Object> get props => [position, shapeId];
}

class ShapePlaced extends LevelEvent {
  final int shapeId;

  ShapePlaced({required this.shapeId});

  @override
  List<Object> get props => [shapeId];
}
