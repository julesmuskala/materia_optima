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
}
