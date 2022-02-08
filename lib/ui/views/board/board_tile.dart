import 'package:flutter/material.dart';
import 'package:materia_optima/ui/shared/animated_color_filtered.dart';
import 'package:provider/provider.dart';

import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/core/alchemy_element.dart';
import 'package:materia_optima/core/models/board_tile_model.dart';
import 'package:materia_optima/core/models/game_model.dart';

class BoardTile extends StatefulWidget {
  const BoardTile({
    Key? key,
    required this.tileModel,
    required this.dimension,
    this.animationDuration = const Duration(milliseconds: 600),
  }) : super(key: key);

  final BoardTileModel tileModel;
  final double dimension;
  final Duration animationDuration;

  @override
  _BoardTileState createState() => _BoardTileState();
}

class _BoardTileState extends State<BoardTile> {
  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment:
          Alignment(widget.tileModel.position.x, widget.tileModel.position.y),
      duration: widget.animationDuration,
      curve: Curves.ease,
      child: Consumer<GameModel>(
        builder: (context, gameValue, child) {
          return AnimatedContainer(
            width: widget.dimension,
            height: widget.dimension,
            curve: Curves.ease,
            duration: widget.animationDuration,
            decoration: BoxDecoration(
              color: _isNullTile ? Colors.transparent : GameColors.grey200,
              boxShadow: [
                BoxShadow(
                  color: _canMove(gameValue.nullTile)
                      ? _getElementLightColor(
                          widget.tileModel.alchemyElement.color,
                        )
                      : Colors.transparent,
                  spreadRadius: 2,
                  blurRadius: 10,
                ),
              ],
            ),
            child: !_isNullTile
                ? Stack(
                    children: <Widget>[
                      Center(
                        child: AnimatedColorFiltered(
                          endColor: widget.tileModel.alchemyElement.color,
                          duration: widget.animationDuration,
                          child: Image.asset(
                            'assets/icons/${widget.tileModel.alchemyElement.iconPath}.png',
                            width: widget.dimension / 2.5,
                            height: widget.dimension / 2.5,
                            filterQuality: FilterQuality.medium,
                          ),
                        ),
                      ),
                      AnimatedColorFiltered(
                        endColor: widget.tileModel.alchemyElement.color,
                        child: Image.asset(
                            'assets/images/board_tile_background.png'),
                      ),
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: _canMove(gameValue.nullTile)
                                ? () => gameValue.moveTile(widget.tileModel)
                                : null,
                          ),
                        ),
                      ),
                    ],
                  )
                : null,
          );
        },
      ),
    );
  }

  bool get _isNullTile =>
      widget.tileModel.alchemyElement == AlchemyElement.materiaNulla;

  Color _getElementLightColor(Color color) {
    if (color.alpha == 0) {
      return color; // Don't decrease transparent color's alpha
    }
    return Color.fromARGB(179, color.red, color.green, color.blue);
  }

  bool _canMove(BoardTileModel? nullTile) {
    if (nullTile == null) {
      throw Exception('Access null tile index before initialization');
    }

    int index = widget.tileModel.position.index;
    // Check if tile is to the north/east/south/west of the tile
    return (index - 4 == nullTile.position.index) ||
        (index + 1 == nullTile.position.index && (index + 1) % 4 != 0) ||
        (index + 4 == nullTile.position.index) ||
        (index - 1 == nullTile.position.index && index % 4 != 0);
  }
}
