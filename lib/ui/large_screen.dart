import 'package:flutter/material.dart';

import 'package:materia_optima/ui/views/board/board_view.dart';
import 'package:materia_optima/ui/views/inventory/inventory_view.dart';
// import 'package:materia_optima/ui/views/compendium/compendium_view.dart';
import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/utils/theme.dart';

class LargeScreenView extends StatelessWidget {
  const LargeScreenView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: <Widget>[
          Text(
            GameStory.lines['app_title']?.toUpperCase() ??
                'Error: no line found',
            style: GameTypography.title,
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            GameStory.lines['app_subtitle'] ?? 'Error: no line found',
            style: GameTypography.subtitle,
          ),
          const SizedBox(
            height: 25.0,
          ),
          Expanded(
            child: Row(
              children: const <Widget>[
                Expanded(
                  flex: 8,
                  child: Placeholder(),
                ),
                Spacer(),
                Expanded(
                  flex: 8,
                  child: BoardView(
                    width: 420.0,
                    key: Key('board_view'),
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 8,
                  child: InventoryView(
                    width: 420.0,
                    key: Key('inventory_view'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
