import 'package:flutter/material.dart';

import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/core/show_dialog.dart';

class CompendiumTab extends StatelessWidget {
  const CompendiumTab({
    Key? key,
    required this.width,
    required this.color,
    required this.entry,
  }) : super(key: key);

  final double width;
  final Color color;
  final StoryEntry entry;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: width,
          height: width * 0.096,
          decoration: BoxDecoration(
            gradient: GameTheme.gradient(color),
            boxShadow: GameTheme.boxShadow,
          ),
          child: Center(
            child: Text(
              GameStory.lines[entry.titleKey]?.toUpperCase() ??
                  'Error: no line found',
              style: GameTypography.displayParagraph(color),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: Ink.image(
            colorFilter: ColorFilter.mode(
              color,
              GameTheme.standardBlendMode,
            ),
            width: width,
            height: width * 0.096,
            image: const AssetImage(
              'assets/images/compendium_tab_background.png',
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
