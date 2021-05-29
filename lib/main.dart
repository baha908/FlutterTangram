import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tangram/bloc/level/level_bloc.dart';
import 'package:flutter_tangram/pages/hard_level_page.dart';
import 'package:flutter_tangram/pages/help_page.dart';
import 'package:flutter_tangram/pages/home_page.dart';
import 'package:flutter_tangram/pages/low_level_page.dart';
import 'package:flutter_tangram/pages/medium_level_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LevelBloc(),
      child: MaterialApp(
        title: 'Material App',
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (_) => HomePage(),
          HelpPage.routeName: (_) => HelpPage(),
          LowLevelPage.routeName: (_) => LowLevelPage(),
          MediumLevelPage.routeName: (_) => MediumLevelPage(),
          HardLevelPage.routeName: (_) => HardLevelPage(),
        },
      ),
    );
  }
}
