import 'package:flutter/material.dart';

import 'package:materia_optima/core/listened_keys.dart';
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
    return ElevatedButton(
      onPressed: onPressed,
      child: RichText(
        text: TextSpan(
          text: '${listenedKey.keyName} ',
          style: onPressed != null
              ? GameTypography.modifiedParagraph(GameColors.orange)
              : GameTypography.modifiedParagraph(GameColors.grey100),
          children: <TextSpan>[
            TextSpan(
              text: description,
              style: onPressed != null
                  ? GameTypography.modifiedParagraph(GameColors.white)
                  : GameTypography.modifiedParagraph(GameColors.grey100),
            ),
          ],
        ),
      ),
    );
  }
}
