import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/core/types/alchemy_element.dart';
import 'package:materia_optima/core/models/board_tile_model.dart';

class BoardTile extends StatelessWidget {
  const BoardTile({
    Key? key,
    required this.tileModel,
    required this.dimension,
    required this.nullTile,
  }) : super(key: key);

  final BoardTileModel tileModel;
  final double dimension;
  final BoardTileModel? nullTile;

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: Alignment(
        tileModel.position.x,
        tileModel.position.y,
      ),
      duration: GameTheme.standardAnimationDuration,
      curve: Curves.ease,
      child: AnimatedContainer(
        width: dimension,
        height: dimension,
        curve: Curves.ease,
        duration: GameTheme.standardAnimationDuration,
        decoration: BoxDecoration(
          color: _isNullTile ? Colors.transparent : GameColors.grey200,
          boxShadow: [
            BoxShadow(
              color: _canMove()
                  ? _getElementLightColor(
                      tileModel.alchemyElement.color,
                    )
                  : Colors.transparent,
              // spreadRadius: 2,
              blurRadius: 10,
            ),
          ],
        ),
        child: !_isNullTile
            ? Stack(
                children: [
                  FadeInImage(
                    placeholder:
                        tileModel.alchemyElement == AlchemyElement.materiaPrima
                            ? MemoryImage(kTransparentImage) as ImageProvider
                            : const AssetImage(
                                'assets/element_tiles/materia_prima.webp',
                              ),
                    fadeInDuration: GameTheme.standardAnimationDuration,
                    fadeOutDuration: GameTheme.standardAnimationDuration,
                    image: AssetImage(
                      'assets/element_tiles/${tileModel.alchemyElement.underscoreName}.webp',
                    ),
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap:
                            _canMove() ? () => tileModel.move(tileModel) : null,
                      ),
                    ),
                  )
                ],
              )
            : null,
      ),
    );
  }

  bool get _isNullTile =>
      tileModel.alchemyElement == AlchemyElement.materiaNulla;

  Color _getElementLightColor(Color color) {
    if (color.alpha == 0) {
      return color; // Don't decrease transparent color's alpha
    }
    return Color.fromARGB(179, color.red, color.green, color.blue);
  }

  bool _canMove() {
    if (nullTile == null) {
      throw Exception('Access null tile index before initialization');
    }

    int index = tileModel.position.index;
    // Check if tile is to the north/east/south/west of the tile
    return (index - 4 == nullTile!.position.index) ||
        (index + 1 == nullTile!.position.index && (index + 1) % 4 != 0) ||
        (index + 4 == nullTile!.position.index) ||
        (index - 1 == nullTile!.position.index && index % 4 != 0);
  }
}
