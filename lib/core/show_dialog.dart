import 'package:flutter/material.dart';
import 'package:materia_optima/ui/shared/tutorial_dialog.dart';
import 'package:provider/provider.dart';

import 'package:materia_optima/ui/shared/story_dialog.dart';
import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/core/models/game_model.dart';

void showStoryDialog(
  BuildContext context,
  StoryEntry entry, {
  required GameModel gameModel,
  bool isInitial = false,
}) {
  showDialog(
    context: context,
    barrierDismissible: !isInitial,
    builder: (_) {
      return ChangeNotifierProvider<GameModel>.value(
        value: gameModel,
        // Check if presenting stage 0
        child: entry.followUpStage != 50
            ? StoryDialog(
                entry: entry,
                canUseProvider: true,
              )
            : TutorialDialog(
                entry: entry,
                canUseProvider: true,
              ),
      );
    },
  );
}

void showMirrorDialog(BuildContext context, StoryEntry entry) {
  showDialog(
    context: context,
    builder: (_) {
      return entry.followUpStage != 50
          ? StoryDialog(
              entry: entry,
              canUseProvider: false,
            )
          : TutorialDialog(
              entry: entry,
              canUseProvider: false,
            );
    },
  );
}
