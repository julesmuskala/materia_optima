import 'package:flutter/material.dart';
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
        child: StoryDialog(
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
      return StoryDialog(
        entry: entry,
        canUseProvider: false,
      );
    },
  );
}
