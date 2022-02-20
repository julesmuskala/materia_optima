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
    return AspectRatio(
      aspectRatio: 375 / 36,
      child: SizedBox(
        width: width,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: GameTheme.gradient(
                  entry.compendiumColor,
                ),
                boxShadow: GameTheme.boxShadow,
              ),
              child: Center(
                child: Text(
                  GameStory.getLine(entry.titleKey).toUpperCase(),
                  style: GameTypography.displayParagraph(
                    entry.compendiumColor,
                  ),
                ),
              ),
            ),
            Image(
              image: AssetImage(
                'assets/ui/compendium_tab/bar_${entry.rarity}.webp',
              ),
              fit: BoxFit.cover,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => showMirrorDialog(context, entry),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
