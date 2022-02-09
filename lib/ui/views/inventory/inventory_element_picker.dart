import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import 'package:materia_optima/core/models/game_model.dart';
import 'package:materia_optima/core/alchemy_element.dart';
import 'package:materia_optima/ui/shared/animated_color_filtered.dart';
import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/utils/types.dart';

class InventoryElementPicker extends StatefulWidget {
  const InventoryElementPicker({
    Key? key,
    required this.width,
    required this.elementDimension,
  }) : super(key: key);

  final double width;
  final double elementDimension;

  @override
  _InventoryElementPickerState createState() => _InventoryElementPickerState();
}

class _InventoryElementPickerState extends State<InventoryElementPicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width,
        child: Selector<GameModel,
            Tuple3<AlchemyElement, VoidCallbackParam<AlchemyElement>, int>>(
          selector: (_, provider) => Tuple3(
            provider.selectedElement,
            provider.selectElement,
            provider.currentQuestStage,
          ),
          builder: (context, gameValue, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _generateElementList(
                selectedElement: gameValue.item1,
                onElementPicked: gameValue.item2,
                currentQuestStage: gameValue.item3,
              ),
            );
          },
        ));
  }

  List<Widget> _generateElementList(
      {required VoidCallbackParam<AlchemyElement> onElementPicked,
      required AlchemyElement selectedElement,
      required int currentQuestStage}) {
    List<AlchemyElement> elementsToRender = AlchemyElement.values;
    elementsToRender = elementsToRender
      ..where((element) => element != AlchemyElement.materiaIncognita)
      ..where((element) => element != AlchemyElement.materiaNulla).toList();
    final int renderedElementsCount = elementsToRender.length;
    elementsToRender = elementsToRender
        .where((element) => element.unlockedByStage <= currentQuestStage)
        .toList();
    final int knownElementsCount = elementsToRender.length;
    for (var i = 0; i < renderedElementsCount - knownElementsCount; i++) {
      elementsToRender.add(AlchemyElement.materiaIncognita);
    }

    return elementsToRender
        .map(
          (element) => SizedBox(
            width: widget.elementDimension,
            height: widget.elementDimension,
            child: Stack(
              children: <Widget>[
                AnimatedColorFiltered(
                  endColor: element.color,
                  child: AnimatedContainer(
                    duration: GameTheme.standardAnimationDuration,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      boxShadow: selectedElement == element
                          ? GameTheme.glow(element.color)
                          : null,
                      borderRadius:
                          BorderRadius.circular(widget.elementDimension / 2),
                    ),
                    child: Image.asset(
                      'assets/icons/${element.iconPath}.png',
                      filterQuality: FilterQuality
                          .medium, // That's why I no longer use Ink.image
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    clipBehavior: Clip.antiAlias,
                    borderRadius:
                        BorderRadius.circular(widget.elementDimension / 2),
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => onElementPicked.call(element),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();
  }
}
