import 'package:flutter/material.dart';

import 'package:materia_optima/utils/theme.dart';

class CompendiumTab extends StatelessWidget {
  const CompendiumTab({
    Key? key,
    required this.width,
    required this.color,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  final double width;
  final Color color;
  final String text;
  final VoidCallback? onPressed;

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
              text.toUpperCase(),
              style: GameTypography.displayParagraph(color),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: Ink.image(
            colorFilter: ColorFilter.mode(
              color,
              BlendMode.modulate,
            ),
            width: width,
            height: width * 0.096,
            image: const AssetImage(
              'assets/images/compendium_tab_background.png',
            ),
            child: InkWell(
              onTap: onPressed,
            ),
          ),
        ),
      ],
    );
  }
}
