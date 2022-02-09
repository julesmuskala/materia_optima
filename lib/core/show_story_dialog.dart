import 'package:flutter/material.dart';

import 'package:materia_optima/ui/shared/story_dialog.dart';
import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/utils/theme.dart';

void showStoryDialog(BuildContext context, int stageToDisplay) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StoryDialog(
        titleKey: GameStory.storyEntries[stageToDisplay]?.titleKey ??
            'error_fallback',
        descriptionKey:
            GameStory.storyEntries[stageToDisplay]?.descriptionKey ??
                'error_fallback',
        assetPath: GameStory.storyEntries[stageToDisplay]?.assetPath,
        onClosed: GameStory.storyEntries[stageToDisplay]?.dialogCallback,
        width: 390.0,
      );
    },
  );
}
