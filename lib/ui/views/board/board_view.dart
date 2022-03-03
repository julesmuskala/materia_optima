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
import 'package:materia_optima/ui/views/board/board_reset_button.dart';

class BoardView extends StatelessWidget {
  const BoardView({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Selector<
        GameModel,
        Tuple5<List<BoardTileModel>, VoidCallbackParam<int>, TypeCallback<int?>,
            BoardTileModel?, int>>(
      selector: (_, provider) => Tuple5(
        provider.boardTiles,
        provider.resetBoardTiles,
        provider.finishGame,
        provider.nullTile,
        provider.tilesNotFilled,
      ),
      builder: (context, gameValue, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              constraints: BoxConstraints(
                maxHeight: width,
                maxWidth: width,
              ),
              height: width,
              width: width,
              decoration: const BoxDecoration(
                color: GameColors.grey200,
                image: DecorationImage(
                  image: AssetImage('assets/ui/board_background.png'),
                  fit: BoxFit.cover,
                ),
                boxShadow: GameTheme.boxShadow,
              ),
              child: Padding(
                padding: EdgeInsets.all(
                  height * 0.015,
                ),
                child: Stack(
                  children: _buildBoardTileList(
                    gameValue.item1,
                    dimension: width * 0.22,
                    nullTile: gameValue.item4,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            FancyButton(
              onPressed: () => _finishBoard(gameValue.item3, context),
              listenedKey: ListenedKeys.spaceKey,
              description: GameStory.getLine('finish_board'),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            BoardResetButton(
              onPressed: gameValue.item5 != 15
                  ? () => gameValue.item2.call(16)
                  : null, // reset 16 tiles
              audioPath: 'assets/sound_effects/effect_reset.mp3',
            ),
          ],
        );
      },
    );
  }

  void _finishBoard(
    TypeCallback<int?> providerFinishCallback,
    BuildContext context,
  ) {
    var result = providerFinishCallback.call();
    if (result != null) {
      var entry = GameStory.storyEntries[result];
      if (entry == null) {
        throw Exception('Tried to show dialog for null entry (entry $result).');
      }
      showStoryDialog(
        context,
        entry,
        gameModel: Provider.of<GameModel>(context, listen: false),
      );
    } else {
      var entry = GameStory.storyEntries[2137];
      if (entry == null) {
        throw Exception('Tried to show dialog for null entry (entry 2137).');
      }
      showMirrorDialog(context, entry);
    }
  }

  List<BoardTile> _buildBoardTileList(
    List<BoardTileModel> tileModels, {
    required double dimension,
    required BoardTileModel? nullTile,
  }) {
    List<BoardTile> boardTiles = [];

    for (var tileModel in tileModels) {
      boardTiles.add(
        BoardTile(
          tileModel: tileModel,
          dimension: dimension,
          nullTile: nullTile,
        ),
      );
    }

    return boardTiles;
  }
}
