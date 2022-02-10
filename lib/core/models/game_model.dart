import 'dart:math';
import 'package:flutter/material.dart';

import 'package:materia_optima/core/types/alchemy_element.dart';
import 'package:materia_optima/core/types/tile_position.dart';
import 'package:materia_optima/core/models/board_tile_model.dart';
import 'package:materia_optima/core/match_pattern.dart';
import 'package:materia_optima/core/game_preferences.dart';
// import 'package:materia_optima/core/show_story_dialog.dart';

class GameModel extends ChangeNotifier {
  GameModel() {
    _initBoardTiles();
    loadSave();
  }

  final Random _random = Random();

  // Track selected element
  AlchemyElement _selectedElement = AlchemyElement.materiaPrima;
  AlchemyElement get selectedElement => _selectedElement;

  void selectElement(AlchemyElement element) {
    _selectedElement = element;
    GamePreferences.setSelectedElement(element);

    notifyListeners();
  }

  // Keep track of quest stages
  int _currentQuestStage = 0;
  int get currentQuestStage => _currentQuestStage;
  void setQuestStage(int stage) {
    _currentQuestStage = stage;
    GamePreferences.setCurrentStage(stage);

    notifyListeners();
  }

  // Used to track changes to the contents of compendium list
  // TODO: change it so it is less
  int lastCompendiumListLength = 0;
  void setLastCompendiumListLength(int value) {
    lastCompendiumListLength = value;
  }

  // Keep track of board state
  final List<BoardTileModel> _boardTiles = [];
  List<BoardTileModel> get boardTiles => List.unmodifiable(_boardTiles);
  int get boardTilesLength => _boardTiles.length;

  BoardTileModel? _nullTile;
  BoardTileModel? get nullTile => _nullTile;

  // Keep track of how many tiles where replaced
  // with selected element
  int _tilesNotFiled = 0;

  // Move all tiles to their default positions
  // and replace elements with materia prima
  void resetBoardTiles([int count = 16]) {
    if (_boardTiles.isEmpty) {
      throw Exception('Reset board before initialization');
    }
    for (var i = 0; i < count; i++) {
      if (boardTiles[i].alchemyElement != AlchemyElement.materiaNulla) {
        _boardTiles[i].alchemyElement = AlchemyElement.materiaPrima;
      }
      _boardTiles[i].position = TilePosition(i);
    }
    _nullTile = _findNullTile();
    _tilesNotFiled = count - 2; // account for null space

    notifyListeners();
  }

  // Swap tile's position with null tile
  void moveTile(BoardTileModel tile) {
    if (_nullTile == null) {
      throw Exception('Access null tile before initialization');
    }
    var temp = tile.position;
    tile.position = _nullTile!.position;
    _nullTile!.position = temp;

    notifyListeners();
  }

  // Add element to board
  bool addTile() {
    if (_boardTiles.isEmpty) {
      throw Exception('Add element to board before initialization');
    }
    if (_tilesNotFiled < 0) {
      notifyListeners();
      return false;
    }
    var randomIndex = _random.nextInt(_boardTiles.length);
    while (_boardTiles[randomIndex].alchemyElement !=
        AlchemyElement.materiaPrima) {
      randomIndex = _random.nextInt(_boardTiles.length);
    }

    _boardTiles[randomIndex].alchemyElement = _selectedElement;
    _tilesNotFiled--;

    notifyListeners();

    return true;
  }

  // Match pattern and increment stage
  int? finishGame() {
    var matchedElement = matchPattern(boardTiles);
    int? resolvedQuestStage = matchedElement.unlockedByStage;

    // Check if result is unlocking next stage
    // Check for null to discard not unlockable elements
    if (resolvedQuestStage != null && _currentQuestStage < resolvedQuestStage) {
      setQuestStage(resolvedQuestStage);
    }

    notifyListeners();
    return resolvedQuestStage;
  }

  void loadSave() async {
    setQuestStage(await GamePreferences.getCurrentStage());
    _selectedElement = await GamePreferences.getSelectedElement();
  }

  void _initBoardTiles([int count = 16]) {
    if (_boardTiles.isNotEmpty) {
      throw Exception('Initialize already initialized board');
    }

    for (var i = 0; i < count; i++) {
      _boardTiles.add(
        BoardTileModel(
          alchemyElement: i != 15
              ? AlchemyElement.materiaPrima
              : AlchemyElement.materiaNulla,
          position: TilePosition(i),
        ),
      );
    }
    _nullTile = _findNullTile();
    _tilesNotFiled = count - 2; // account for null space

    notifyListeners();
  }

  BoardTileModel _findNullTile() {
    if (_boardTiles.isEmpty) {
      throw Exception('Find null tile before initialization');
    }
    if (_boardTiles.last.alchemyElement == AlchemyElement.materiaNulla) {
      return _boardTiles.last;
    }
    for (var i = 0; i < boardTilesLength - 1; i++) {
      if (_boardTiles[i].alchemyElement == AlchemyElement.materiaNulla) {
        return _boardTiles[i];
      }
    }

    throw Exception('No null tile found');
  }
}
