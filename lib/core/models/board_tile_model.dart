import 'package:flutter/material.dart';

import 'package:materia_optima/core/tile_position.dart';
import 'package:materia_optima/core/alchemy_element.dart';

class BoardTileModel {
  TilePosition position;
  AlchemyElement alchemyElement;

  BoardTileModel({
    required this.alchemyElement,
    required this.position,
  });

  void moveToIndex(int index) {
    position = TilePosition(index);
  }

  @override
  bool operator ==(Object other) =>
      other is BoardTileModel &&
      alchemyElement == other.alchemyElement &&
      position == other.position;

  @override
  int get hashCode => hashValues(alchemyElement, position);
}
