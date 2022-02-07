import 'package:flutter/material.dart';
import 'package:materia_optima/game.dart';
import 'package:materia_optima/utils/script.dart';
import 'package:materia_optima/utils/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: gameScriptLines['app_title'] ?? 'Error: no line found',
      theme: GameTheme.data,
      home: Game(),
    );
  }
}
