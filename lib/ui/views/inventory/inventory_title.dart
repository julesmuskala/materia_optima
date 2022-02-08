import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:materia_optima/core/models/game_model.dart';
import 'package:materia_optima/core/alchemy_element.dart';
import 'package:materia_optima/utils/theme.dart';

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
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  gameValue.selectedElement.color,
                  BlendMode.modulate,
                ),
                child: Image.asset('assets/images/inventory_element_frame.png'),
              ),
              Container(
                width: double.maxFinite,
                height: double.maxFinite,
                alignment: Alignment.center,
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
