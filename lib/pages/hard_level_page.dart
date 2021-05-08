import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tangram/widget/level_widget.dart';

class HardLevelPage extends StatefulWidget {
  static const routeName = '/hard_level_page';

  @override
  _HardLevelPageState createState() => _HardLevelPageState();
}

class _HardLevelPageState extends State<HardLevelPage> {
  int currentLevel = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LevelWidget(level: currentLevel),
        ElevatedButton(
            onPressed: () {
              setState(() {
                this.currentLevel = 1;
              });
            },
            child: Text("1")),
        ElevatedButton(
            onPressed: () {
              setState(() {
                this.currentLevel = 2;
              });
            },
            child: Text("2")),
      ],
    );
  }
}
