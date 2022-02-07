import 'package:flutter/material.dart';
import 'package:materia_optima/core/game_model.dart';
import 'package:materia_optima/ui/large_screen.dart';
import 'package:provider/provider.dart';

class Game extends StatefulWidget {
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
    return Scaffold(
      body: ChangeNotifierProvider<GameModel>(
        create: (_) => GameModel(),
        child: LargeScreenView(),
      ),
    );
  }
}
