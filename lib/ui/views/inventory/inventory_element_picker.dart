import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:materia_optima/core/models/game_model.dart';
import 'package:materia_optima/core/alchemy_element.dart';

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
        child: Consumer<GameModel>(
          builder: (context, gameValue, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _generateElementList(gameValue.selectElement),
            );
          },
        ));
  }

  List<Widget> _generateElementList(
      void Function(AlchemyElement) onElementPicked) {
    final currentQuestStage = Provider.of<GameModel>(context).currentQuestStage;
    List<AlchemyElement> elementsToRender = AlchemyElement.values;
    elementsToRender = elementsToRender
        .where((element) => element != AlchemyElement.materiaIncognita)
        .where((element) => element != AlchemyElement.materiaNulla)
        .toList();
    final int renderedElementsCount = elementsToRender.length;
    elementsToRender = elementsToRender
        .where((element) => element.unlockedByStage <= currentQuestStage)
        .toList();
    final int knownElementsCount = elementsToRender.length;
    for (var i = 0; i < renderedElementsCount - knownElementsCount; i++) {
      elementsToRender.add(AlchemyElement.materiaIncognita);
    }

    return elementsToRender
        .map((element) => SizedBox(
              width: widget.elementDimension,
              height: widget.elementDimension,
              child: Material(
                clipBehavior: Clip.antiAlias,
                borderRadius:
                    BorderRadius.circular(widget.elementDimension / 2),
                color: Colors.transparent,
                child: Ink.image(
                  colorFilter: ColorFilter.mode(
                    element.color,
                    BlendMode.modulate,
                  ),
                  width: widget.elementDimension,
                  height: widget.elementDimension,
                  image: AssetImage(
                    'assets/icons/${element.iconPath}.png',
                  ),
                  fit: BoxFit.cover,
                  child: InkWell(
                    onTap: () => onElementPicked.call(element),
                  ),
                ),
              ),
            ))
        .toList();
  }
}
