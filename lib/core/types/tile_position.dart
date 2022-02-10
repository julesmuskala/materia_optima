class TilePosition {
  final int index;
  final double x;
  final double y;

  TilePosition(this.index)
      : x = _xFromIndex(index),
        y = _yFromIndex(index);

  @override
  String toString() {
    return 'TilePosition($index, $x, $y)';
  }

  @override
  bool operator ==(Object other) =>
      other is TilePosition && index == other.index;

  @override
  int get hashCode => index;

  static double _xFromIndex(int index) {
    switch (index) {
      case 0:
      case 4:
      case 8:
      case 12:
        return -1;
      case 1:
      case 5:
      case 9:
      case 13:
        return -0.33;
      case 2:
      case 6:
      case 10:
      case 14:
        return 0.33;
      case 3:
      case 7:
      case 11:
      case 15:
        return 1;
    }
    return 0.0;
  }

  static double _yFromIndex(int index) {
    switch (index) {
      case 0:
      case 1:
      case 2:
      case 3:
        return -1;
      case 4:
      case 5:
      case 6:
      case 7:
        return -0.33;
      case 8:
      case 9:
      case 10:
      case 11:
        return 0.33;
      case 12:
      case 13:
      case 14:
      case 15:
        return 1;
    }
    return 0;
  }
}
