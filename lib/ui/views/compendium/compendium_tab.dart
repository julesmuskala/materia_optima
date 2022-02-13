import 'package:flutter/material.dart';

import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/core/show_dialog.dart';

class CompendiumTab extends StatelessWidget {
  const CompendiumTab({
    Key? key,
    required this.width,
    required this.entry,
  }) : super(key: key);

  final double width;
  final StoryEntry entry;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: width,
          height: width * 0.096,
          decoration: BoxDecoration(
            gradient: GameTheme.gradient(
              entry.compendiumColor ?? GameColors.grey50,
            ),
            boxShadow: GameTheme.boxShadow,
          ),
          child: Center(
            child: Text(
              GameStory.getLine(entry.titleKey).toUpperCase(),
              style: GameTypography.displayParagraph(
                entry.compendiumColor ?? GameColors.grey50,
              ),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: Ink.image(
            colorFilter: ColorFilter.mode(
              entry.compendiumColor ?? GameColors.grey50,
              GameTheme.standardBlendMode,
            ),
            width: width,
            height: width * 0.096,
            image: const AssetImage(
              'assets/ui/compendium_tab_background.png',
            ),
            child: InkWell(
              onTap: () => showMirrorDialog(context, entry),
            ),
          ),
        ),
      ],
    );
  }
}
