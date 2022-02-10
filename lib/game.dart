import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:materia_optima/ui/large_screen.dart';
import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/core/models/game_model.dart';
import 'package:materia_optima/core/show_dialog.dart';

class Game extends StatefulWidget {
  const Game({
    Key? key,
  }) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  late final _startStage =
      Provider.of<GameModel>(context, listen: false).currentQuestStage;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _showInitDialog());

    return const SafeArea(
      child: Scaffold(
        body: LargeScreenView(),
      ),
    );
  }

  void _showInitDialog() {
    if (_startStage == 0) {
      showStoryDialog(context, GameStory.storyEntries[0]!, isInitial: true);
    }
  }
}
