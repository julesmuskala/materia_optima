import 'package:flutter/material.dart';
import 'package:materia_optima/ui/shared/fancy_button.dart';
import 'package:materia_optima/ui/views/inventory/inventory_element_picker.dart';
import 'package:materia_optima/core/alchemy_element.dart';
import 'package:materia_optima/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:materia_optima/core/game_model.dart';
import 'package:materia_optima/ui/views/inventory/inventory_title.dart';
import 'package:materia_optima/utils/script.dart';
import 'package:materia_optima/core/listened_keys.dart';

class InventoryView extends StatefulWidget {
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
    return Consumer<GameModel>(
      builder: (context, gameValue, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const InventoryElementPicker(
              width: 375.2,
              elementDimension: 33.6,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Image.asset(
              'assets/images/inventory_divider.png',
              width: 420.0,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const InventoryTitle(
              width: 375.2,
              height: 67.2,
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: 375.2,
              height: 120.0,
              child: Text(
                gameScriptLines[
                        gameValue.selectedElement.scriptLineDescriptionKey] ??
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
              onPressed: (gameValue.selectedElement ==
                          AlchemyElement.materiaIncognita ||
                      gameValue.selectedElement == AlchemyElement.materiaPrima)
                  ? null
                  : () => _addToBoard(gameValue.addToBoard),
            ),
          ],
        );
      },
    );
  }

  void _addToBoard(bool Function() providerFunc) {
    // TODO: do sth with addToBoard() result
    providerFunc();
  }
}
