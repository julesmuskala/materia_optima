import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:materia_optima/core/models/game_model.dart';
import 'package:materia_optima/core/alchemy_element.dart';
import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/ui/shared/animated_color_filtered.dart';

class InventoryTitle extends StatefulWidget {
  const InventoryTitle({
    Key? key,
    required this.height,
    required this.width,
    this.animationDuration = const Duration(milliseconds: 600),
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
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: const BoxDecoration(
        boxShadow: GameTheme.boxShadow,
      ),
      child: Consumer<GameModel>(
        builder: (context, gameValue, child) {
          return Stack(
            children: <Widget>[
              AnimatedColorFiltered(
                endColor: gameValue.selectedElement.color,
                duration: widget.animationDuration,
                child: Image.asset('assets/images/inventory_element_frame.png'),
              ),
              AnimatedContainer(
                width: double.maxFinite,
                height: double.maxFinite,
                alignment: Alignment.center,
                duration: widget.animationDuration,
                decoration: BoxDecoration(
                  gradient: GameTheme.gradient(gameValue.selectedElement.color),
                ),
                child: Text(
                  gameValue.selectedElement.name.toUpperCase(),
                  style: GameTypography.elementTitle(
                      gameValue.selectedElement.color),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
