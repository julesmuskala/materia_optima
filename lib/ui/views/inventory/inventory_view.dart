import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import 'package:materia_optima/ui/shared/fancy_button.dart';
import 'package:materia_optima/ui/views/inventory/inventory_element_picker.dart';
import 'package:materia_optima/core/types/alchemy_element.dart';
import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/core/models/game_model.dart';
import 'package:materia_optima/ui/views/inventory/inventory_title.dart';
import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/core/types/listened_keys.dart';
import 'package:materia_optima/core/types/types.dart';
import 'package:materia_optima/core/show_dialog.dart';

class InventoryView extends StatelessWidget {
  const InventoryView({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Selector<GameModel, Tuple3<AlchemyElement, TypeCallback<bool>, int>>(
      selector: (_, gameValue) => Tuple3(
        gameValue.selectedElement,
        gameValue.addTile,
        gameValue.tilesNotFilled,
      ),
      child: InventoryElementPicker(
        width: width * 0.9,
        elementDimension: width * 0.9 * 0.09,
      ),
      builder: (context, gameValue, child) {
        // selectedElement, addToBoard
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            child!,
            SizedBox(
              height: height * 0.02,
            ),
            Image.asset(
              'assets/ui/inventory_divider.png',
              width: width,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            InventoryTitle(
              width: width * 0.9,
              height: width * 0.9 * 0.18,
              selectedElement: gameValue.item1,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              width: width * 0.9,
              constraints: BoxConstraints(
                minHeight: height * 0.2,
              ),
              child: Text(
                GameStory.getLine(gameValue.item1.scriptLineDescriptionKey),
                style: GameTypography.paragraph,
                textAlign: TextAlign.justify,
                softWrap: true,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            FancyButton(
              listenedKey: ListenedKeys.enterKey,
              description: 'Add to board (${gameValue.item3} free tiles left)',
              // Disable ability to add materia incognita
              // or materia prima to board
              onPressed: (gameValue.item1 == AlchemyElement.materiaIncognita ||
                      gameValue.item1 == AlchemyElement.materiaPrima ||
                      gameValue.item3 <= 0)
                  ? null
                  : () => _addTile(gameValue.item2, context),
            ),
          ],
        );
      },
    );
  }

  void _addTile(
    TypeCallback<bool> providerAddTileCallback,
    BuildContext context,
  ) {
    bool result = providerAddTileCallback.call();

    if (!result) {
      var entry = GameStory.storyEntries[6969];
      if (entry == null) {
        throw Exception('Tried to show dialog for null entry (entry 6969).');
      }
      showMirrorDialog(context, entry);
    }
  }
}
