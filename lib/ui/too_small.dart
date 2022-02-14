import 'package:flutter/material.dart';

import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/utils/theme.dart';

class TooSmall extends StatelessWidget {
  const TooSmall({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            GameStory.getLine('screen_too_small'),
            style: GameTypography.modifiedParagraph(GameColors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
