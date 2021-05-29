part of 'level_bloc.dart';

class LevelState extends Equatable {
  final List<Shape> shapes;
  final LevelStatus status;
  final int score;
  final int levelNo;
  final int difficulty;
  LevelState({
    this.shapes = const [],
    this.score = 0,
    this.levelNo = 0,
    this.difficulty = 0,
    this.status = const InitialGameStatus(),
  });

  LevelState copyWith({
    List<Shape>? shapes,
    LevelStatus? status,
    int? score,
    int? levelNo,
    int? difficulty,
  }) {
    return LevelState(
      shapes: shapes ?? this.shapes,
      status: status ?? this.status,
      score: score ?? this.score,
      levelNo: levelNo ?? this.levelNo,
      difficulty: difficulty ?? this.difficulty,
    );
  }

  @override
  List<Object> get props => [shapes, score, levelNo, difficulty, status];
}
