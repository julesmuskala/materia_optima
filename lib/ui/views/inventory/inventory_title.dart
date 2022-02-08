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
    return SizedBox(
      width: widget.width,
      height: widget.height,
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
                  gradient: LinearGradient(
                    colors: _gradientColors(gameValue.selectedElement.color),
                    stops: const [0, 0.5, 1],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
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

  List<Color> _gradientColors(Color color) {
    var colorAlpha50 = Color.fromARGB(127, color.red, color.green, color.blue);
    var colorAlpha10 = Color.fromARGB(25, color.red, color.green, color.blue);

    return [colorAlpha50, colorAlpha10, colorAlpha50];
  }
}
