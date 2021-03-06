import 'package:flutter/material.dart';

import 'package:materia_optima/core/types/tile_position.dart';
import 'package:materia_optima/core/types/alchemy_element.dart';
import 'package:materia_optima/core/types/types.dart';

class BoardTileModel {
  BoardTileModel({
    required this.alchemyElement,
    required this.position,
    required this.move,
  });

  TilePosition position;
  AlchemyElement alchemyElement;
  VoidCallbackParam<BoardTileModel> move;

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
