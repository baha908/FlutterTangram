import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tangram/bloc/level/level_bloc.dart';
import 'package:flutter_tangram/model/level_status.dart';
import 'package:flutter_tangram/pages/home_page.dart';
import 'package:flutter_tangram/widget/shape_widget.dart';
import 'package:flutter_tangram/widget/target_widget.dart';

class LevelWidget extends StatefulWidget {
  final int levelNo;
  LevelWidget({
    Key? key,
    required this.levelNo,
  }) : super(key: key);

  @override
  _LevelWidgetState createState() => _LevelWidgetState();
}

class _LevelWidgetState extends State<LevelWidget> {
  @override
  void initState() {
    super.initState();
    context.read<LevelBloc>().add(GetLevel(levelNo: widget.levelNo));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LevelBloc, LevelState>(
      listener: (context, state) {
        print(state.status.toString());
      },
      builder: (context, state) {
        if ((state.status is LevelEnd)) {
          return _buildLevelEnd(context);
        } else if (state.status is LevelLoading) {
          return _buildLevelLoading(state);
        } else {
          return _buildLevel(state);
        }
      },
    );
  }

  Widget _buildLevel(LevelState state) {
    return Container(
      child: Stack(children: [
        ...state.shapes.map((e) => TargetWidget(shape: e)),
        ...state.shapes.map((e) => ShapeWidget(shape: e)),
      ]),
    );
  }

  Widget _buildLevelLoading(LevelState state) {
    return Container(
        color: _difficultyToColor(state.difficulty),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                state.levelNo.toString(),
                style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 80),
              ),
            ],
          ),
        ));
  }

  Widget _buildLevelEnd(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Game Over",
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 60),
            ),
            SizedBox(
              height: 200,
            ),
            TextButton(
              child: Text(
                'Play Again',
                style: TextStyle(color: Colors.yellow, fontSize: 30),
              ),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    HomePage.routeName, (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }

  _difficultyToColor(int difficulty) {
    switch (difficulty) {
      case 1:
        return Colors.green;
      case 2:
        return Colors.yellow[700];
      case 3:
        return Colors.red;
      default:
        return Exception("Wrong difficuly value");
    }
  }
}
