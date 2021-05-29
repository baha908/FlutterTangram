import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tangram/data/levels.dart';
import 'package:flutter_tangram/model/level.dart';
import 'package:flutter_tangram/model/level_status.dart';
import 'package:flutter_tangram/model/position.dart';
import 'package:flutter_tangram/model/shape.dart';

part 'level_event.dart';
part 'level_state.dart';

class LevelBloc extends Bloc<LevelEvent, LevelState> {
  LevelBloc() : super(LevelState());

  @override
  Stream<LevelState> mapEventToState(
    LevelEvent event,
  ) async* {
    if (event is GetLevel) {
      var level = getLevel(event.levelNo);
      yield state.copyWith(
        status: LevelLoading(),
        levelNo: level.levelNo,
        difficulty: level.difficulty,
      );
      await Future.delayed(Duration(seconds: 1));
      yield state.copyWith(
        score: 0,
        shapes: level.shapes,
        status: LevelLoaded(),
      );
    } else if (event is GetNextLevel) {
      var nextLevelNo = state.levelNo + 1;
      if (levels.length < nextLevelNo) {
        yield state.copyWith(status: LevelEnd());
      } else {
        var level = getLevel(nextLevelNo);
        yield state.copyWith(
          status: LevelLoading(),
          levelNo: level.levelNo,
          difficulty: level.difficulty,
        );
        await Future.delayed(Duration(seconds: 1));
        yield state.copyWith(
          score: 0,
          shapes: level.shapes,
          status: LevelLoaded(),
        );
      }
    } else if (event is ShapeMoved) {
      List<Shape> shapes = [];
      state.shapes.forEach((shape) {
        if (shape.id == event.shapeId) {
          shapes.add(shape.copyWith(
            position: Position(event.position.x, event.position.y),
          ));
        } else {
          shapes.add(shape.copyWith());
        }
      });
      yield state.copyWith(shapes: shapes);
      print(state.levelNo);
      add(InitialEvent());
    } else if (event is ShapePlaced) {
      List<Shape> shapes = [];
      state.shapes.forEach((shape) {
        if (shape.id == event.shapeId) {
          shapes.add(shape.copyWith(
            isPlaced: true,
            targetColor: shape.color,
          ));
        } else {
          shapes.add(shape.copyWith());
        }
      });
      yield state.copyWith(shapes: shapes, score: state.score + 1);
      add(InitialEvent());
      if (state.score == state.shapes.length) {
        add(GetNextLevel());
      }
    }
  }

  Level getLevel(int levelNo) {
    return (json.decode((json.encode(levels))) as List)
        .map((i) => Level.fromJson(i))
        .toList()[levelNo - 1];
  }
}
