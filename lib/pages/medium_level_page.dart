import 'package:flutter/material.dart';
import 'package:flutter_tangram/widget/level_widget.dart';

class MediumLevelPage extends StatefulWidget {
  static const routeName = '/medium_level_page';

  @override
  _MediumLevelPageState createState() => _MediumLevelPageState();
}

class _MediumLevelPageState extends State<MediumLevelPage> {
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
