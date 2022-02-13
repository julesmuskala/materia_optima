import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:materia_optima/game.dart';
import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/core/models/game_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: GameStory.getLine('app_title'),
      theme: GameTheme.data,
      home: ChangeNotifierProvider<GameModel>(
        create: (_) => GameModel(),
        child: const Game(),
      ),
    );
  }
}
