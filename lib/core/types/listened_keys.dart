import 'package:flutter/services.dart';

enum ListenedKeys {
  spaceKey,
  enterKey,
  rKey,
  xKey,
}

extension ListenedKeysExtension on ListenedKeys {
  String get keyName {
    switch (this) {
      case ListenedKeys.enterKey:
        return '[enter]';
      case ListenedKeys.rKey:
        return '[R]';
      case ListenedKeys.spaceKey:
        return '[space]';
      case ListenedKeys.xKey:
        return '[X]';
    }
  }

  LogicalKeyboardKey get logicalKeyValue {
    switch (this) {
      case ListenedKeys.enterKey:
        return LogicalKeyboardKey.enter;
      case ListenedKeys.rKey:
        return LogicalKeyboardKey.keyR;
      case ListenedKeys.spaceKey:
        return LogicalKeyboardKey.space;
      case ListenedKeys.xKey:
        return LogicalKeyboardKey.keyX;
    }
  }
}
