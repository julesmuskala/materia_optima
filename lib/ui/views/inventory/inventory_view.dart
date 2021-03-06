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
    return Selector<GameModel, Tuple3<AlchemyElement, VoidCallback, int>>(
      selector: (_, gameValue) => Tuple3(
        gameValue.selectedElement,
        gameValue.addTile,
        gameValue.tilesNotFilled,
      ),
      child: InventoryElementPicker(
        width: width * 0.9,
        elementDimension: width * 0.9 * 0.11,
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
            AnimatedSize(
              duration: GameTheme.standardAnimationDuration,
              alignment: Alignment.topCenter,
              child: Container(
                width: width * 0.9,
                constraints: BoxConstraints(
                  minHeight: height * 0.25,
                ),
                child: Text(
                  GameStory.getLine(gameValue.item1.scriptLineDescriptionKey),
                  style: GameTypography.paragraph,
                  softWrap: true,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            FancyButton(
              listenedKey: ListenedKeys.enterKey,
              description: 'Add to board (${gameValue.item3} free tiles left)',
              // onPressed: (gameValue.item1 == AlchemyElement.materiaIncognita ||
              //         gameValue.item1 == AlchemyElement.materiaPrima ||
              //         gameValue.item3 <= 0)
              onPressed: _blockOnPressed(gameValue.item1, gameValue.item3)
                  ? null
                  : () => _addTile(gameValue.item2, context),
            ),
          ],
        );
      },
    );
  }

  bool _blockOnPressed(AlchemyElement selectedElement, int tilesNotFilled) {
    if (selectedElement == AlchemyElement.materiaIncognita) {
      return true;
    }
    if (selectedElement == AlchemyElement.materiaPrima) {
      return tilesNotFilled == 15;
    }

    return tilesNotFilled <= 0;
  }

  void _addTile(
    VoidCallback providerAddTileCallback,
    BuildContext context,
  ) {
    // bool result = providerAddTileCallback.call();

    // if (!result) {
    //   var entry = GameStory.storyEntries[6969];
    //   if (entry == null) {
    //     throw Exception('Tried to show dialog for null entry (entry 6969).');
    //   }
    //   showMirrorDialog(context, entry);
    // }

    providerAddTileCallback.call();
  }
}
