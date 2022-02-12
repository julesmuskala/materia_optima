import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import 'package:materia_optima/core/models/board_tile_model.dart';
import 'package:materia_optima/ui/shared/fancy_button.dart';
import 'package:materia_optima/ui/views/board/board_tile.dart';
import 'package:materia_optima/core/types/listened_keys.dart';
import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/core/models/game_model.dart';
import 'package:materia_optima/core/types/types.dart';
import 'package:materia_optima/core/show_dialog.dart';

class BoardView extends StatefulWidget {
  const BoardView({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  _BoardViewState createState() => _BoardViewState();
}

class _BoardViewState extends State<BoardView> {
  @override
  Widget build(BuildContext context) {
    return Selector<
            GameModel,
            Tuple3<List<BoardTileModel>, VoidCallbackParam<int>,
                TypeCallback<int?>>>(
        selector: (_, provider) => Tuple3(
              provider.boardTiles,
              provider.resetBoardTiles,
              provider.finishGame,
            ),
        builder: (context, gameValue, child) {
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
                  padding: EdgeInsets.all(
                    widget.height * 0.015,
                  ),
                  child: Stack(
                    children: _buildBoardTileList(
                      gameValue.item1,
                      dimension: widget.width * 0.22,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: widget.height * 0.02,
              ),
              FancyButton(
                onPressed: () => _finishBoard(gameValue.item3, context),
                listenedKey: ListenedKeys.spaceKey,
                description:
                    GameStory.lines['finish_board'] ?? 'Error: no line found',
              ),
              SizedBox(
                height: widget.height * 0.04,
              ),
              FancyButton(
                onPressed: () => gameValue.item2.call(16), // reset 16 tiles
                listenedKey: ListenedKeys.rKey,
                description:
                    GameStory.lines['reset_board'] ?? 'Error: no line found',
              ),
            ],
          );
        });
  }

  void _finishBoard(
    TypeCallback<int?> providerFinishCallback,
    BuildContext context,
  ) {
    // TODO: do sth with finishGame() result
    var result = providerFinishCallback.call();
    if (result != null) {
      var entry = GameStory.storyEntries[result];
      if (entry == null) {
        throw Exception('Tried to show dialog for null entry (entry $result).');
      }
      showStoryDialog(context, entry);
    }
  }

  List<BoardTile> _buildBoardTileList(
    List<BoardTileModel> tileModels, {
    required double dimension,
  }) {
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
