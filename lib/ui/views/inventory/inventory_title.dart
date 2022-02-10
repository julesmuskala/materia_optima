import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:materia_optima/core/models/game_model.dart';
import 'package:materia_optima/core/types/alchemy_element.dart';
import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/ui/shared/animated_color_filtered.dart';
import 'package:materia_optima/core/types/responsive_layout_size.dart';

class InventoryTitle extends StatefulWidget {
  const InventoryTitle({
    Key? key,
    required this.height,
    required this.width,
    this.animationDuration = GameTheme.standardAnimationDuration,
  }) : super(key: key);

  final double width;
  final double height;
  final Duration animationDuration;

  @override
  _InventoryTitleState createState() => _InventoryTitleState();
}

class _InventoryTitleState extends State<InventoryTitle> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: const BoxDecoration(
        boxShadow: GameTheme.boxShadow,
      ),
      child: Selector<GameModel, AlchemyElement>(
        selector: (_, gameValue) => gameValue.selectedElement,
        builder: (context, selectedElement, child) {
          return Stack(
            children: <Widget>[
              AnimatedColorFiltered(
                endColor: selectedElement.color,
                duration: widget.animationDuration,
                child: Image.asset('assets/images/inventory_element_frame.png'),
              ),
              AnimatedContainer(
                width: double.maxFinite,
                height: double.maxFinite,
                alignment: Alignment.center,
                duration: widget.animationDuration,
                decoration: BoxDecoration(
                  gradient: GameTheme.gradient(selectedElement.color),
                ),
                child: Text(
                  selectedElement.name.toUpperCase(),
                  style: GameTypography.responsiveElementTitle(
                    getLayoutSize(screenSize.width),
                    selectedElement.color,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
