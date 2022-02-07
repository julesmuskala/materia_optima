import 'package:flutter/material.dart';
import 'package:materia_optima/ui/views/board/board_view.dart';
import 'package:materia_optima/ui/views/inventory/inventory_view.dart';
import 'package:materia_optima/utils/script.dart';
import 'package:materia_optima/utils/theme.dart';

class LargeScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: <Widget>[
          Text(
            gameScriptLines['app_title']?.toUpperCase() ??
                'Error: no line found',
            style: GameTypography.title,
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            gameScriptLines['app_subtitle'] ?? 'Error: no line found',
            style: GameTypography.subtitle,
          ),
          const SizedBox(
            height: 25.0,
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 8,
                  child: BoardView(),
                ),
                const Spacer(),
                Expanded(
                  flex: 8,
                  child: InventoryView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
