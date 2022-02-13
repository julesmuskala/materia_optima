import 'package:flutter/material.dart';

import 'package:materia_optima/utils/theme.dart';

enum AlchemyElement {
  materiaNulla,
  materiaIncognita,
  materiaPrima,
  rebis,
  caeleum,
  quebrith,
  aether,
  vermilion,
  materiaOptima,
}

extension AlchemyElementExtension on AlchemyElement {
  String get underscoreName {
    switch (this) {
      case AlchemyElement.aether:
      case AlchemyElement.caeleum:
      case AlchemyElement.quebrith:
      case AlchemyElement.rebis:
      case AlchemyElement.vermilion:
        return toString().split('.')[1];
      case AlchemyElement.materiaIncognita:
        return 'materia_incognita';
      case AlchemyElement.materiaOptima:
        return 'materia_optima';
      case AlchemyElement.materiaPrima:
        return 'materia_prima';
      case AlchemyElement.materiaNulla:
        return 'materia_nulla';
    }
  }

  String get name {
    switch (this) {
      case AlchemyElement.aether:
      case AlchemyElement.caeleum:
      case AlchemyElement.quebrith:
      case AlchemyElement.rebis:
      case AlchemyElement.vermilion:
        {
          var rawValue = underscoreName;
          return '${rawValue[0].toUpperCase()}${rawValue.substring(1)}';
        }
      case AlchemyElement.materiaNulla:
      case AlchemyElement.materiaOptima:
      case AlchemyElement.materiaPrima:
        {
          var rawValue = underscoreName.split('_').join(' ');
          return '${rawValue[0].toUpperCase()}${rawValue.substring(1)}';
        }
      case AlchemyElement.materiaIncognita:
        return '???';
    }
  }

  String get iconPath {
    if (this == AlchemyElement.materiaNulla) {
      throw Exception('Access non-existent image asset');
    }

    return '${underscoreName}_icon';
  }

  String get scriptLineDescriptionKey {
    return '${underscoreName}_desc';
  }

  Color get color {
    switch (this) {
      case AlchemyElement.materiaPrima:
        return GameColors.grey100;
      case AlchemyElement.aether:
        return GameColors.orange;
      case AlchemyElement.caeleum:
        return GameColors.blue;
      case AlchemyElement.rebis:
        return GameColors.green;
      case AlchemyElement.quebrith:
        return GameColors.violet;
      case AlchemyElement.vermilion:
        return GameColors.yellow;
      case AlchemyElement.materiaOptima:
        return GameColors.white;
      case AlchemyElement.materiaIncognita:
        return GameColors.grey50;
      default:
        return Colors.transparent;
    }
  }

  int? get unlockedByStage {
    switch (this) {
      case AlchemyElement.aether:
        return 400;
      case AlchemyElement.caeleum:
        return 200;
      case AlchemyElement.quebrith:
        return 300;
      case AlchemyElement.rebis:
        return 100;
      case AlchemyElement.vermilion:
        return 500;
      case AlchemyElement.materiaIncognita:
        return null;
      case AlchemyElement.materiaOptima:
        return 600;
      case AlchemyElement.materiaPrima:
        return 0;
      case AlchemyElement.materiaNulla:
        return null;
    }
  }
}
