import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tangram/widget/level_widget.dart';

class HardLevelPage extends StatelessWidget {
  static const routeName = '/hard_level_page';

  @override
  Widget build(BuildContext context) {
    return LevelWidget(
      levelNo: 8,
    );
  }
}
