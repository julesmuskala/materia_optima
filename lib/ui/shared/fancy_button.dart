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
    final screenHeight = MediaQuery.of(context).size.height;

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        side: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return const BorderSide(
                color: GameColors.grey100,
                width: 2.65,
              );
            }
            return const BorderSide(
              color: GameColors.grey50,
              width: 2.65,
            );
          },
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(12.0),
        ),
      ),
      child: RichText(
        text: TextSpan(
          text: '',
          // text: '${listenedKey.keyName} ',
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
