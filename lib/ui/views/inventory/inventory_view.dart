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

class InventoryView extends StatefulWidget {
  const InventoryView({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  _InventoryViewState createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  @override
  Widget build(BuildContext context) {
    return Selector<GameModel, Tuple2<AlchemyElement, TypeCallback<bool>>>(
      selector: (_, gameValue) => Tuple2(
        gameValue.selectedElement,
        gameValue.addTile,
      ),
      child: InventoryElementPicker(
        width: widget.width * 0.9,
        elementDimension: widget.width * 0.9 * 0.09,
      ),
      builder: (context, gameValue, child) {
        // selectedElement, addToBoard
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            child!,
            SizedBox(
              height: widget.height * 0.02,
            ),
            Image.asset(
              'assets/ui/inventory_divider.png',
              width: widget.width,
            ),
            SizedBox(
              height: widget.height * 0.02,
            ),
            InventoryTitle(
              width: widget.width * 0.9,
              height: widget.width * 0.9 * 0.18,
            ),
            SizedBox(
              height: widget.height * 0.02,
            ),
            SizedBox(
              width: widget.width * 0.9,
              height: widget.height * 0.16,
              child: Text(
                GameStory.lines[gameValue.item1.scriptLineDescriptionKey] ??
                    'Error: no line found',
                style: GameTypography.paragraph,
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: widget.height * 0.02,
            ),
            FancyButton(
              listenedKey: ListenedKeys.enterKey,
              description: 'Add to board',
              // Disable ability to add materia incognita
              // or materia prima to board
              onPressed: (gameValue.item1 == AlchemyElement.materiaIncognita ||
                      gameValue.item1 == AlchemyElement.materiaPrima)
                  ? null
                  : () => _addTile(gameValue.item2),
            ),
          ],
        );
      },
    );
  }

  void _addTile(TypeCallback<bool> providerAddTileCallback) {
    // TODO: do sth with addToBoard() result
    providerAddTileCallback.call();
  }
}
