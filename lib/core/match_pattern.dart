//
// Generated file. Do not edit.
//

import 'package:materia_optima/core/types/alchemy_element.dart';
import 'package:materia_optima/core/models/board_tile_model.dart';

AlchemyElement matchPattern(List<BoardTileModel> boardTiles,
    [int tileCount = 16]) {
  Map<AlchemyElement, int> matchesFoundMap = {};

  for (var tile in boardTiles) {
    switch (tile.position.index) {
      case 0:
        if (tile.alchemyElement == AlchemyElement.materiaNulla) {
          matchesFoundMap.update(AlchemyElement.rebis, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.caeleum, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.quebrith, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.aether, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.vermilion, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.materiaOptima, (value) => ++value, ifAbsent: () => 1);
        }
        break;
      case 1:
        if (tile.alchemyElement == AlchemyElement.materiaPrima) {
          matchesFoundMap.update(AlchemyElement.rebis, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.aether, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.rebis) {
          matchesFoundMap.update(AlchemyElement.caeleum, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.quebrith, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.aether) {
          matchesFoundMap.update(AlchemyElement.vermilion, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.vermilion) {
          matchesFoundMap.update(AlchemyElement.materiaOptima, (value) => ++value, ifAbsent: () => 1);
        }
        break;
      case 2:
        if (tile.alchemyElement == AlchemyElement.materiaPrima) {
          matchesFoundMap.update(AlchemyElement.rebis, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.aether, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.rebis) {
          matchesFoundMap.update(AlchemyElement.caeleum, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.quebrith, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.aether) {
          matchesFoundMap.update(AlchemyElement.vermilion, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.materiaOptima, (value) => ++value, ifAbsent: () => 1);
        }
        break;
      case 3:
        if (tile.alchemyElement == AlchemyElement.materiaPrima) {
          matchesFoundMap.update(AlchemyElement.rebis, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.caeleum, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.quebrith, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.quebrith) {
          matchesFoundMap.update(AlchemyElement.aether, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.aether) {
          matchesFoundMap.update(AlchemyElement.vermilion, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.vermilion) {
          matchesFoundMap.update(AlchemyElement.materiaOptima, (value) => ++value, ifAbsent: () => 1);
        }
        break;
      case 4:
        if (tile.alchemyElement == AlchemyElement.materiaPrima) {
          matchesFoundMap.update(AlchemyElement.rebis, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.caeleum, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.caeleum) {
          matchesFoundMap.update(AlchemyElement.quebrith, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.aether, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.quebrith) {
          matchesFoundMap.update(AlchemyElement.vermilion, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.materiaOptima, (value) => ++value, ifAbsent: () => 1);
        }
        break;
      case 5:
        if (tile.alchemyElement == AlchemyElement.materiaPrima) {
          matchesFoundMap.update(AlchemyElement.rebis, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.caeleum, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.quebrith, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.quebrith) {
          matchesFoundMap.update(AlchemyElement.aether, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.caeleum) {
          matchesFoundMap.update(AlchemyElement.vermilion, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.aether) {
          matchesFoundMap.update(AlchemyElement.materiaOptima, (value) => ++value, ifAbsent: () => 1);
        }
        break;
      case 6:
        if (tile.alchemyElement == AlchemyElement.materiaPrima) {
          matchesFoundMap.update(AlchemyElement.rebis, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.caeleum, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.quebrith, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.quebrith) {
          matchesFoundMap.update(AlchemyElement.aether, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.vermilion, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.materiaOptima, (value) => ++value, ifAbsent: () => 1);
        }
        break;
      case 7:
        if (tile.alchemyElement == AlchemyElement.materiaPrima) {
          matchesFoundMap.update(AlchemyElement.rebis, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.caeleum, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.caeleum) {
          matchesFoundMap.update(AlchemyElement.quebrith, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.aether, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.vermilion, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.aether) {
          matchesFoundMap.update(AlchemyElement.materiaOptima, (value) => ++value, ifAbsent: () => 1);
        }
        break;
      case 8:
        if (tile.alchemyElement == AlchemyElement.materiaPrima) {
          matchesFoundMap.update(AlchemyElement.rebis, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.caeleum, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.caeleum) {
          matchesFoundMap.update(AlchemyElement.quebrith, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.aether, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.vermilion, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.materiaOptima, (value) => ++value, ifAbsent: () => 1);
        }
        break;
      case 9:
        if (tile.alchemyElement == AlchemyElement.materiaPrima) {
          matchesFoundMap.update(AlchemyElement.rebis, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.caeleum, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.quebrith, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.quebrith) {
          matchesFoundMap.update(AlchemyElement.aether, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.vermilion, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.materiaOptima, (value) => ++value, ifAbsent: () => 1);
        }
        break;
      case 10:
        if (tile.alchemyElement == AlchemyElement.materiaPrima) {
          matchesFoundMap.update(AlchemyElement.rebis, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.caeleum, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.quebrith, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.quebrith) {
          matchesFoundMap.update(AlchemyElement.aether, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.caeleum) {
          matchesFoundMap.update(AlchemyElement.vermilion, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.materiaOptima, (value) => ++value, ifAbsent: () => 1);
        }
        break;
      case 11:
        if (tile.alchemyElement == AlchemyElement.materiaPrima) {
          matchesFoundMap.update(AlchemyElement.rebis, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.caeleum, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.caeleum) {
          matchesFoundMap.update(AlchemyElement.quebrith, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.aether, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.quebrith) {
          matchesFoundMap.update(AlchemyElement.vermilion, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.materiaOptima, (value) => ++value, ifAbsent: () => 1);
        }
        break;
      case 12:
        if (tile.alchemyElement == AlchemyElement.materiaPrima) {
          matchesFoundMap.update(AlchemyElement.rebis, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.caeleum, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.quebrith, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.quebrith) {
          matchesFoundMap.update(AlchemyElement.aether, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.aether) {
          matchesFoundMap.update(AlchemyElement.vermilion, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.rebis) {
          matchesFoundMap.update(AlchemyElement.materiaOptima, (value) => ++value, ifAbsent: () => 1);
        }
        break;
      case 13:
        if (tile.alchemyElement == AlchemyElement.materiaPrima) {
          matchesFoundMap.update(AlchemyElement.rebis, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.rebis) {
          matchesFoundMap.update(AlchemyElement.caeleum, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.quebrith, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.caeleum) {
          matchesFoundMap.update(AlchemyElement.aether, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.materiaOptima, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.aether) {
          matchesFoundMap.update(AlchemyElement.vermilion, (value) => ++value, ifAbsent: () => 1);
        }
        break;
      case 14:
        if (tile.alchemyElement == AlchemyElement.materiaPrima) {
          matchesFoundMap.update(AlchemyElement.rebis, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.rebis) {
          matchesFoundMap.update(AlchemyElement.caeleum, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.quebrith, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.materiaOptima, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.caeleum) {
          matchesFoundMap.update(AlchemyElement.aether, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.aether) {
          matchesFoundMap.update(AlchemyElement.vermilion, (value) => ++value, ifAbsent: () => 1);
        }
        break;
      case 15:
        if (tile.alchemyElement == AlchemyElement.materiaPrima) {
          matchesFoundMap.update(AlchemyElement.rebis, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.caeleum, (value) => ++value, ifAbsent: () => 1);
          matchesFoundMap.update(AlchemyElement.quebrith, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.quebrith) {
          matchesFoundMap.update(AlchemyElement.aether, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.aether) {
          matchesFoundMap.update(AlchemyElement.vermilion, (value) => ++value, ifAbsent: () => 1);
        }
        if (tile.alchemyElement == AlchemyElement.caeleum) {
          matchesFoundMap.update(AlchemyElement.materiaOptima, (value) => ++value, ifAbsent: () => 1);
        }
        break;
      default:
        throw Exception('Unexpected TilePosition index');
    }
  }

  for (var match in matchesFoundMap.entries) {
    if (match.value == tileCount) {
      return match.key;
    }
  }
  return AlchemyElement.materiaNulla;
}
