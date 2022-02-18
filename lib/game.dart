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

class Game extends StatelessWidget {
  const Game({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: FutureBuilder(
        future: Future.delayed(
          Duration.zero,
          () => _showInitDialog(
            Provider.of<GameModel>(context, listen: false).currentQuestStage,
            context,
            _screenWidth,
          ),
        ),
        builder: (context, snapshot) {
          return const ResponsiveLayoutBuilder(
            landscape: LandscapeScreen(),
            portrait: PortraitScreen(),
            tooSmall: TooSmall(),
          );
        },
      ),
    );
  }

  void _showInitDialog(
    int startStage,
    BuildContext context,
    double screenWidth,
  ) {
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
