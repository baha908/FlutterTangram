import 'package:flutter/material.dart';
import 'package:flutter_tangram/widget/level_widget.dart';

class LowLevelPage extends StatefulWidget {
  static const routeName = '/low_level_page';
  @override
  _LowLevelPageState createState() => _LowLevelPageState();
}

class _LowLevelPageState extends State<LowLevelPage> {
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
