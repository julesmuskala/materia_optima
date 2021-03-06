import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/core/types/listened_keys.dart';
import 'package:materia_optima/ui/shared/fancy_button.dart';
import 'package:materia_optima/ui/shared/story_dialog_animation.dart';
import 'package:materia_optima/core/models/game_model.dart';
import 'package:materia_optima/core/types/types.dart';
import 'package:materia_optima/core/show_dialog.dart';

class TutorialDialog extends StatelessWidget {
  const TutorialDialog({
    Key? key,
    required this.entry,
    required this.canUseProvider,
  }) : super(key: key);

  final StoryEntry entry;
  final bool canUseProvider;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return StoryDialogAnimation(
      dialogContent: Dialog(
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
                        entry.compendiumColor,
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
                      width: double.maxFinite,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        enableFeedback: false,
                        onTap: _launchGithub,
                        child: Text(
                          GameStory.getLine('repo_link'),
                          style: GameTypography.paragraphLink,
                          softWrap: true,
                        ),
                      ),
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
                    Image.asset(
                      'assets/patterns/tutorial.webp',
                      height: screenSize.height * 0.12,
                      width: screenSize.height * 0.12,
                    ),
                    SizedBox(
                      height: screenSize.height * 0.03,
                    ),
                    canUseProvider
                        ? Selector<GameModel, VoidCallbackParam<int>>(
                            selector: (_, provider) => provider.setQuestStage,
                            builder: (context, setQuestStage, child) {
                              return FancyButton(
                                listenedKey: ListenedKeys.xKey,
                                description: GameStory.getLine('close_dialog'),
                                onPressed: () => _handlePress(
                                  context,
                                  setQuestStage,
                                  entry.followUpStage,
                                ),
                              );
                            },
                          )
                        : FancyButton(
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

  void _handlePress(
    BuildContext context,
    VoidCallbackParam<int> setQuestStage,
    int? followUpStage,
  ) {
    precacheImage(
      const AssetImage('assets/ui/compendium_tab/bar_common.webp'),
      context,
    );
    precacheImage(
      const AssetImage(
        'assets/ui/inventory_element/frame_materia_incognita.webp',
      ),
      context,
    );
    Navigator.pop(context);
    if (followUpStage != null) {
      setQuestStage(followUpStage);
      showStoryDialog(
        context,
        GameStory.storyEntries[followUpStage]!,
        gameModel: Provider.of<GameModel>(context, listen: false),
      );
    }
  }

  void _launchGithub() async {
    if (!await launch('https://github.com/julesmuskala/materia_optima')) {
      throw 'Could not launch GitHub';
    }
  }
}
