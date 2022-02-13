import 'package:flutter/material.dart';

import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/core/types/listened_keys.dart';
import 'package:materia_optima/ui/shared/fancy_button.dart';
import 'package:materia_optima/ui/shared/story_dialog_animation.dart';

class StoryDialog extends StatelessWidget {
  const StoryDialog({
    Key? key,
    required this.entry,
  }) : super(key: key);

  final StoryEntry entry;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return StoryDialogAnimation(
      dialogContent: Dialog(
        backgroundColor: GameColors.grey200,
        shape: const ContinuousRectangleBorder(
          side: BorderSide(
            color: GameColors.grey50,
            width: 2.5,
          ),
        ),
        child: Container(
          width: screenSize.width * 0.87,
          constraints: const BoxConstraints(
            maxWidth: 450.0,
          ),
          child: Padding(
            padding: EdgeInsets.all(screenSize.height * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      GameStory.getLine(entry.titleKey).toUpperCase(),
                      style: GameTypography.elementTitle(
                        GameColors.shadowBlack,
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.03,
                    ),
                    Text(
                      GameStory.getLine(entry.descriptionKey),
                      style: GameTypography.paragraph,
                      softWrap: true,
                    ),
                    SizedBox(
                      height: screenSize.height * 0.03,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    entry.assetPath != null
                        ? Image.asset(
                            'assets/${entry.assetPath}',
                            height: screenSize.height * 0.12,
                            width: screenSize.height * 0.12,
                            filterQuality: FilterQuality.medium,
                          )
                        : const SizedBox(
                            height: 0.0,
                            width: 0.0,
                          ),
                    SizedBox(
                      height: screenSize.height * 0.03,
                    ),
                    FancyButton(
                      listenedKey: ListenedKeys.xKey,
                      description: GameStory.getLine('close_dialog'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
