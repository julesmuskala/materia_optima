import 'package:flutter/material.dart';

import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/ui/views/board/board_view.dart';
import 'package:materia_optima/ui/views/inventory/inventory_view.dart';
import 'package:materia_optima/ui/views/compendium/compendium_view.dart';

class PortraitScreen extends StatefulWidget {
  const PortraitScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PortraitScreen> createState() => _PortraitScreenState();
}

class _PortraitScreenState extends State<PortraitScreen>
    with TickerProviderStateMixin {
  int _tab = 1;

  late final TabController _controller = TabController(
    length: 3,
    vsync: this,
    initialIndex: _tab,
    animationDuration: GameTheme.standardAnimationDuration,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: GameTheme.preferredAppBarSize(screenSize),
        child: Padding(
          padding: EdgeInsets.all(
            screenSize.height * 0.01,
          ),
          child: Column(
            children: [
              Text(
                GameStory.getLine('app_title').toUpperCase(),
                style: GameTypography.title,
              ),
              Text(
                GameStory.getLine('app_subtitle'),
                style: GameTypography.subtitle,
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          CompendiumView(
            width: screenSize.width * 0.8,
            height: screenSize.height,
            key: const Key('compendium_view'),
          ),
          BoardView(
            width: screenSize.width * 0.8,
            height: screenSize.height,
            key: const Key('board_view'),
          ),
          InventoryView(
            width: screenSize.width * 0.8,
            height: screenSize.height,
            key: const Key('inventory_view'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value) {
          _controller.animateTo(value);
          setState(() {
            _tab = value;
          });
        },
        currentIndex: _tab,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.collections_bookmark_outlined,
            ),
            label: 'Compendium',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.grid_4x4_outlined,
            ),
            label: 'Board',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.inventory_2_outlined,
            ),
            label: 'Inventory',
          ),
        ],
      ),
    );
  }
}
