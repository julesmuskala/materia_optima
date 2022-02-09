import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:materia_optima/core/models/game_model.dart';
import 'package:materia_optima/ui/large_screen.dart';

class Game extends StatefulWidget {
  const Game({
    Key? key,
  }) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider<GameModel>(
        create: (_) => GameModel(),
        child: const Scaffold(
          body: LargeScreenView(),
        ),
      ),
    );
  }
}
