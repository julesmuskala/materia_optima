import 'package:flutter/material.dart';

import 'package:materia_optima/ui/shared/story_dialog.dart';
import 'package:materia_optima/utils/story.dart';

void showStoryDialog(BuildContext context, StoryEntry entry) {
  showDialog(
    context: context,
    builder: (_) {
      return StoryDialog(
        titleKey: entry.titleKey,
        descriptionKey: entry.descriptionKey,
        assetPath: entry.assetPath,
        onClosed: entry.dialogCallback,
        width: 390.0,
      );
    },
  );
}
