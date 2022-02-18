import 'package:flutter/material.dart';

import 'package:materia_optima/core/types/listened_keys.dart';
import 'package:materia_optima/utils/theme.dart';

class FancyButton extends StatelessWidget {
  const FancyButton({
    Key? key,
    this.onPressed,
    required this.listenedKey,
    required this.description,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final ListenedKeys listenedKey;
  final String description;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: GameTheme.standardAnimationDuration,
      decoration: BoxDecoration(
        boxShadow: onPressed != null ? GameTheme.boxShadow : null,
        border: Border(
          bottom: BorderSide(
            color: onPressed != null ? GameColors.grey100 : GameColors.grey200,
            width: 3.0,
          ),
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          description,
          style: onPressed != null
              ? GameTypography.modifiedParagraph(GameColors.grey200)
              : GameTypography.modifiedParagraph(GameColors.grey50),
        ),
      ),
    );
  }
}
