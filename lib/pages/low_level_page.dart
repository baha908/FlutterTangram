import 'package:flutter/material.dart';
import 'package:flutter_tangram/widget/level_widget.dart';

class LowLevelPage extends StatefulWidget {
  static const routeName = '/low_level_page';

  @override
  _LowLevelPageState createState() => _LowLevelPageState();
}

class _LowLevelPageState extends State<LowLevelPage> {
  @override
  Widget build(BuildContext context) {
    return LevelWidget(
      levelNo: 1,
    );
  }
}
