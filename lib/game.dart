import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:materia_optima/ui/landscape_screen.dart';
import 'package:materia_optima/ui/portrait_screen.dart';
import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/core/models/game_model.dart';
import 'package:materia_optima/core/show_dialog.dart';
import 'package:materia_optima/ui/shared/responsive_layout_builder.dart';

class Game extends StatefulWidget {
  const Game({
    Key? key,
  }) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration.zero,
      () => _showInitDialog(
        Provider.of<GameModel>(context, listen: false).currentQuestStage,
      ),
    );

    return const SafeArea(
      child: ResponsiveLayoutBuilder(
        landscape: LandscapeScreen(),
        portrait: PortraitScreen(),
        tooSmall: Placeholder(),
      ),
    );
  }

  void _showInitDialog(int startStage) {
    if (startStage != 0) return;

    showStoryDialog(context, GameStory.storyEntries[0]!, isInitial: true);
  }
}
