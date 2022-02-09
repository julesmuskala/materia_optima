import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import 'package:materia_optima/ui/shared/fancy_button.dart';
import 'package:materia_optima/ui/views/inventory/inventory_element_picker.dart';
import 'package:materia_optima/core/alchemy_element.dart';
import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/core/models/game_model.dart';
import 'package:materia_optima/ui/views/inventory/inventory_title.dart';
import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/core/listened_keys.dart';
import 'package:materia_optima/utils/types.dart';

class InventoryView extends StatefulWidget {
  const InventoryView({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  _InventoryViewState createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  @override
  void initState() {
    // print(GameScript.scanDescription('1234~1234~1234'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<GameModel, Tuple2<AlchemyElement, BoolCallback>>(
      selector: (_, gameValue) => Tuple2(
        gameValue.selectedElement,
        gameValue.addToBoard,
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
            const SizedBox(
              height: 20.0,
            ),
            Image.asset(
              'assets/images/inventory_divider.png',
              width: widget.width,
            ),
            const SizedBox(
              height: 20.0,
            ),
            InventoryTitle(
              width: widget.width * 0.9,
              height: widget.width * 0.9 * 0.18,
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: widget.width * 0.9,
              height: 120.0,
              child: Text(
                GameStory.lines[gameValue.item1.scriptLineDescriptionKey] ??
                    'Error: no line found',
                style: GameTypography.paragraph,
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            FancyButton(
              listenedKey: ListenedKeys.enterKey,
              description: 'Add to board',
              // Disable ability to add materia incognita
              // or materia prima to board
              onPressed: (gameValue.item1 == AlchemyElement.materiaIncognita ||
                      gameValue.item1 == AlchemyElement.materiaPrima)
                  ? null
                  : () => _addToBoard(gameValue.item2),
            ),
          ],
        );
      },
    );
  }

  void _addToBoard(BoolCallback providerFunc) {
    // TODO: do sth with addToBoard() result
    providerFunc.call();
  }
}
