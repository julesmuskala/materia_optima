import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:materia_optima/ui/landscape_screen.dart';
import 'package:materia_optima/ui/portrait_screen.dart';
import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/core/models/game_model.dart';
import 'package:materia_optima/core/show_dialog.dart';
import 'package:materia_optima/ui/shared/responsive_layout_builder.dart';
import 'package:materia_optima/core/types/responsive_layout.dart';
import 'package:materia_optima/ui/too_small.dart';

class Game extends StatefulWidget {
  const Game({
    Key? key,
  }) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  bool _dialogShown = false;

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;

    if (!_dialogShown) {
      Future.delayed(
        Duration.zero,
        () => _showInitDialog(
          Provider.of<GameModel>(context, listen: false).currentQuestStage,
          context,
          _screenWidth,
        ),
      );
    }

    return const SafeArea(
      child: ResponsiveLayoutBuilder(
        landscape: LandscapeScreen(),
        portrait: PortraitScreen(),
        tooSmall: TooSmall(),
      ),
    );
  }

  void _showInitDialog(
    int startStage,
    BuildContext context,
    double screenWidth,
  ) {
    _dialogShown = true;
    if (startStage != 0 ||
        ResponsiveLayoutBreakpoints.getLayoutSize(screenWidth) ==
            ResponsiveLayoutSize.extraSmall) {
      return;
    }

    showStoryDialog(
      context,
      GameStory.storyEntries[0]!,
      gameModel: Provider.of<GameModel>(context, listen: false),
      isInitial: true,
    );
  }
}
