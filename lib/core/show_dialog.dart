import 'package:flutter/material.dart';

import 'package:materia_optima/ui/shared/story_dialog.dart';
import 'package:materia_optima/utils/story.dart';

void showStoryDialog(
  BuildContext context,
  StoryEntry entry, {
  bool isInitial = false,
}) {
  showDialog(
    context: context,
    barrierDismissible: !isInitial,
    builder: (_) {
      return StoryDialog(
        entry: entry,
        width: 390.0,
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
        width: 390.0,
      );
    },
  );
}
