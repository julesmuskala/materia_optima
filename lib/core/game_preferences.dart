import 'package:materia_optima/core/alchemy_element.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GamePreferences {
  static const String _selectedElementKey = 'selected_element';
  static const String _currentQuestStageKey = 'quest_stage';

  static void setSelectedElement(AlchemyElement element) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_selectedElementKey, _serializeElement(element));
  }

  static Future<AlchemyElement> getSelectedElement() async {
    final prefs = await SharedPreferences.getInstance();
    final int? intValue = prefs.getInt(_selectedElementKey);
    if (intValue == null) return AlchemyElement.materiaPrima;
    return _deserializeElement(intValue);
  }

  static void setCurrentStage(int questStage) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_currentQuestStageKey, questStage);
  }

  static Future<int> getCurrentStage() async {
    final prefs = await SharedPreferences.getInstance();
    final int? stageValue = prefs.getInt(_currentQuestStageKey);
    return stageValue ?? 0;
  }

  static int _serializeElement(AlchemyElement element) {
    switch (element) {
      case AlchemyElement.aether:
        return 0;
      case AlchemyElement.caeleum:
        return 1;
      case AlchemyElement.materiaIncognita:
        return 2;
      case AlchemyElement.materiaNulla:
        return 3;
      case AlchemyElement.materiaOptima:
        return 4;
      case AlchemyElement.materiaPrima:
        return 5;
      case AlchemyElement.quebrith:
        return 6;
      case AlchemyElement.rebis:
        return 7;
      case AlchemyElement.vermilion:
        return 8;
    }
  }

  static AlchemyElement _deserializeElement(int serializedElement) {
    switch (serializedElement) {
      case 0:
        return AlchemyElement.aether;
      case 1:
        return AlchemyElement.caeleum;
      case 2:
        return AlchemyElement.materiaIncognita;
      case 3:
        return AlchemyElement.materiaNulla;
      case 4:
        return AlchemyElement.materiaOptima;
      case 5:
        return AlchemyElement.materiaPrima;
      case 6:
        return AlchemyElement.quebrith;
      case 7:
        return AlchemyElement.rebis;
      case 8:
        return AlchemyElement.vermilion;
    }

    throw Exception('Provided int does not represent any AlchemyElement');
  }
}
