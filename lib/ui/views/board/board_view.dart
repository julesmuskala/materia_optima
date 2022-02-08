import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:materia_optima/core/models/board_tile_model.dart';
import 'package:materia_optima/ui/shared/fancy_button.dart';
import 'package:materia_optima/ui/views/board/board_tile.dart';
import 'package:materia_optima/core/listened_keys.dart';
import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/core/models/game_model.dart';

class BoardView extends StatefulWidget {
  const BoardView({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  _BoardViewState createState() => _BoardViewState();
}

class _BoardViewState extends State<BoardView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GameModel>(builder: (context, gameValue, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxHeight: widget.width,
              maxWidth: widget.width,
            ),
            height: widget.width,
            width: widget.width,
            decoration: const BoxDecoration(
              color: GameColors.grey200,
              image: DecorationImage(
                image: AssetImage('assets/images/board_background.png'),
                fit: BoxFit.cover,
              ),
              boxShadow: GameTheme.boxShadow,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Stack(
                children: _buildBoardTileList(
                  gameValue.boardTiles,
                  dimension: widget.width * 0.22,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 35.0,
          ),
          FancyButton(
            onPressed: () => _finishBoard(gameValue.finishGame),
            listenedKey: ListenedKeys.spaceKey,
            description:
                GameStory.lines['finish_board'] ?? 'Error: no line found',
          ),
          const SizedBox(
            height: 70.0,
          ),
          FancyButton(
            onPressed: () => gameValue.resetBoardTiles(),
            listenedKey: ListenedKeys.rKey,
            description:
                GameStory.lines['reset_board'] ?? 'Error: no line found',
          ),
        ],
      );
    });
  }

  void _finishBoard(bool Function() providerFunc) {
    // TODO: do sth with finishGame() result
    providerFunc.call();
  }

  List<BoardTile> _buildBoardTileList(List<BoardTileModel> tileModels,
      {required double dimension}) {
    List<BoardTile> boardTiles = [];

    for (var tileModel in tileModels) {
      boardTiles.add(
        BoardTile(
          tileModel: tileModel,
          dimension: dimension,
        ),
      );
    }

    return boardTiles;
  }
}
