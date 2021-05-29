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

  Container _buildLevel(LevelState state) {
    return Container(
      child: Stack(children: [
        ...state.shapes.map((e) => TargetWidget(shape: e)),
        ...state.shapes.map((e) => ShapeWidget(shape: e)),
      ]),
    );
  }

  Center _buildLevelLoading(LevelState state) {
    return Center(
      child: Column(
        children: [
          Text(state.difficulty.toString()),
          Text(state.levelNo.toString())
        ],
      ),
    );
  }

  Center _buildLevelEnd(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('game over'),
          ElevatedButton(
            child: Text('ana sayfa'),
            onPressed: () {
              Navigator.of(context).pushNamed(HomePage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
