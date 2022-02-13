import 'package:flutter/material.dart';

import 'package:materia_optima/ui/shared/animated_color_filtered.dart';

class BoardTileInside extends StatelessWidget {
  const BoardTileInside({
    Key? key,
    required this.color,
    required this.duration,
    required this.iconPath,
    required this.dimension,
    this.onTap,
  }) : super(key: key);

  final Color color;
  final Duration duration;
  final String iconPath;
  final double dimension;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Image.asset(
            'assets/element_icons/$iconPath.webp',
            width: dimension,
            height: dimension,
          ),
        ),
        AnimatedColorFiltered(
          endColor: color,
          child: Image.asset('assets/ui/board_tile_background.png'),
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
