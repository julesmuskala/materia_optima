import 'package:flutter/material.dart';

import 'package:materia_optima/game.dart';
import 'package:materia_optima/utils/script.dart';
import 'package:materia_optima/utils/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: gameScriptLines['app_title'] ?? 'Error: no line found',
      theme: GameTheme.data,
      home: const Game(),
    );
  }
}
