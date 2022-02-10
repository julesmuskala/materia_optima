import 'package:flutter/material.dart';

import 'package:materia_optima/core/types/listened_keys.dart';
import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/core/types/responsive_layout_size.dart';

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
    final screenSize = MediaQuery.of(context).size;

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            vertical: screenSize.height * 0.02,
            horizontal: screenSize.width * 0.015,
          ),
        ),
        side: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(
              color: GameColors.grey100,
              width: screenSize.width * 0.001,
            );
          }
          return BorderSide(
            color: GameColors.grey50,
            width: screenSize.width * 0.001,
          );
        }),
      ),
      child: RichText(
        text: TextSpan(
          text: '${listenedKey.keyName} ',
          style: onPressed != null
              ? GameTypography.modifiedResponsiveParagraph(
                  getLayoutSize(screenSize.width),
                  GameColors.orange,
                )
              : GameTypography.modifiedResponsiveParagraph(
                  getLayoutSize(screenSize.width),
                  GameColors.grey100,
                ),
          children: <TextSpan>[
            TextSpan(
              text: description,
              style: onPressed != null
                  ? GameTypography.modifiedResponsiveParagraph(
                      getLayoutSize(screenSize.width),
                      GameColors.white,
                    )
                  : GameTypography.modifiedResponsiveParagraph(
                      getLayoutSize(screenSize.width),
                      GameColors.grey100,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
