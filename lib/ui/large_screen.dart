import 'package:flutter/material.dart';

import 'package:materia_optima/ui/views/board/board_view.dart';
import 'package:materia_optima/ui/views/compendium/compendium_view.dart';
import 'package:materia_optima/ui/views/inventory/inventory_view.dart';
import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/core/types/responsive_layout_size.dart';

class LargeScreenView extends StatelessWidget {
  const LargeScreenView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(screenSize.height * 0.05),
      child: Column(
        children: <Widget>[
          Text(
            GameStory.lines['app_title']?.toUpperCase() ??
                'Error: no line found',
            style: GameTypography.responsiveTitle(
              getLayoutSize(
                screenSize.width,
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.005,
          ),
          Text(
            GameStory.lines['app_subtitle'] ?? 'Error: no line found',
            style: GameTypography.responsiveSubtitle(
              getLayoutSize(
                screenSize.width,
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.025,
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: CompendiumView(
                    width: screenSize.width * 0.22,
                    height: screenSize.height,
                    key: const Key('compendium_view'),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 8,
                  child: BoardView(
                    width: screenSize.width * 0.22,
                    height: screenSize.height,
                    key: const Key('board_view'),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 8,
                  child: InventoryView(
                    width: screenSize.width * 0.22,
                    height: screenSize.height,
                    key: const Key('inventory_view'),
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
