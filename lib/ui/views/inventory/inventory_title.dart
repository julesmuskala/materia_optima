import 'package:flutter/material.dart';

import 'package:materia_optima/core/types/alchemy_element.dart';
import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/ui/shared/animated_color_filtered.dart';

class InventoryTitle extends StatelessWidget {
  const InventoryTitle({
    Key? key,
    required this.height,
    required this.width,
    required this.selectedElement,
  }) : super(key: key);

  final double width;
  final double height;
  final AlchemyElement selectedElement;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        boxShadow: GameTheme.boxShadow,
      ),
      child: Stack(
        children: <Widget>[
          AnimatedColorFiltered(
            endColor: selectedElement.color,
            duration: GameTheme.standardAnimationDuration,
            child: Image.asset('assets/ui/inventory_element_frame.png'),
          ),
          AnimatedContainer(
            width: double.maxFinite,
            height: double.maxFinite,
            alignment: Alignment.center,
            duration: GameTheme.standardAnimationDuration,
            decoration: BoxDecoration(
              gradient: GameTheme.gradient(selectedElement.color),
            ),
            child: Text(
              selectedElement.name.toUpperCase(),
              style: GameTypography.elementTitle(
                selectedElement.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
