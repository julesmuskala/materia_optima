import 'package:flutter/material.dart';
import 'package:materia_optima/core/board_tile_model.dart';
import 'package:materia_optima/ui/shared/fancy_button.dart';
import 'package:materia_optima/ui/views/board/board_tile.dart';
import 'package:materia_optima/core/listened_keys.dart';
import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/utils/script.dart';
import 'package:materia_optima/core/game_model.dart';
import 'package:provider/provider.dart';

class BoardView extends StatefulWidget {
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
            constraints: const BoxConstraints(
              maxHeight: 420.0,
              maxWidth: 420.0,
            ),
            height: 420.0,
            width: 420.0,
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
                children: _buildBoardTileList(gameValue.boardTiles),
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
                gameScriptLines['finish_board'] ?? 'Error: no line found',
          ),
          const SizedBox(
            height: 100.0,
          ),
          FancyButton(
            onPressed: () => gameValue.resetBoardTiles(),
            listenedKey: ListenedKeys.rKey,
            description:
                gameScriptLines['reset_board'] ?? 'Error: no line found',
          ),
        ],
      );
    });
  }

  void _finishBoard(bool Function() providerFunc) {
    // TODO: do sth with finishGame() result
    providerFunc();
  }

  List<BoardTile> _buildBoardTileList(List<BoardTileModel> tileModels,
      [double dimension = 92]) {
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
