import 'package:flutter/material.dart';
import 'package:materia_optima/utils/theme.dart';

class BoardTileInside extends StatelessWidget {
  const BoardTileInside({
    Key? key,
    required this.color,
    required this.duration,
    required this.iconPath,
    required this.dimension,
    required this.underscoreName,
    this.onTap,
  }) : super(key: key);

  final Color color;
  final Duration duration;
  final String iconPath;
  final double dimension;
  final String underscoreName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: FadeInImage(
            width: dimension / 2.5,
            height: dimension / 2.5,
            image: AssetImage('assets/element_icons/$iconPath.webp'),
            placeholder: const AssetImage(
              'assets/element_icons/materia_prima_icon.webp',
            ),
            fadeInDuration: GameTheme.standardAnimationDuration,
          ),
        ),
        FadeInImage(
          width: dimension,
          height: dimension,
          image: AssetImage('assets/ui/board_tile/frame_$underscoreName.webp'),
          placeholder: const AssetImage(
            'assets/ui/board_tile/frame_materia_prima.webp',
          ),
          fadeInDuration: GameTheme.standardAnimationDuration,
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
