import 'package:flutter/material.dart';
import 'package:flutter_tangram/widget/level_widget.dart';

class MediumLevelPage extends StatelessWidget {
  static const routeName = '/medium_level_page';

  @override
  Widget build(BuildContext context) {
    return LevelWidget(
      levelNo: 4,
    );
  }
}
