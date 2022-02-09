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
}
