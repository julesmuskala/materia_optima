import 'package:flutter/material.dart';

import 'package:materia_optima/core/types/alchemy_element.dart';
import 'package:materia_optima/utils/theme.dart';

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
          FadeInImage(
            placeholder: const AssetImage(
              'assets/ui/inventory_element/frame_materia_prima.webp',
            ),
            fadeInDuration: GameTheme.standardAnimationDuration,
            image: AssetImage(
              'assets/ui/inventory_element/frame_${selectedElement.underscoreName}.webp',
            ),
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
