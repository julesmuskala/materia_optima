import 'dart:collection';
import 'package:flutter/material.dart';

import 'package:materia_optima/utils/theme.dart';

class StoryEntry {
  StoryEntry({
    required this.titleKey,
    required this.descriptionKey,
    this.compendiumColor,
    this.assetPath,
  });

  final String titleKey;
  final String descriptionKey;
  final Color? compendiumColor;
  final String? assetPath;
}

abstract class GameStory {
  static const Map<String, String> lines = {
    'error_fallback': 'Error: provided key is null',
    'app_title': 'Materia Optima',
    'app_subtitle': 'by Juliusz Muskala',
    // Semantic
    'finish_board': 'Start amalgamation',
    'reset_board': 'Clear board',
    'close_dialog': 'Close',
    // Element descriptions
    'materia_nulla_desc': 'Wow, just wow! How did you...',
    'materia_prima_desc':
        'Nullam pulvinar volutpat ex, at molestie justo rutrum in. Ut vel justo vitae nisl pellentesque pharetra in id ante. Sed mattis felis dolor, in venenatis turpis efficitur aliquet. Curabitur fermentum, magna tempor fermentum aliquet, turpis elit cursus dui, iaculis commodo sem felis vitae neque.',
    // Story entries
    'quest_title_0': 'Welcome to Materia Optima',
    'quest_desc_0':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis placerat, enim nec varius blandit, mi dui interdum orci.',
    'quest_title_100': 'Rebis discovered',
    'quest_desc_100':
        'Nunc pellentesque pellentesque sodales. Fusce vel lectus erat. Nullam pulvinar, erat pulvinar egestas ultrices, enim turpis condimentum urna, mollis porttitor mauris arcu vitae mi.',
    'quest_title_200': 'Caeleum discovered',
    'quest_desc_200':
        'Nunc pellentesque pellentesque sodales. Fusce vel lectus erat. Nullam pulvinar, erat pulvinar egestas ultrices, enim turpis condimentum urna, mollis porttitor mauris arcu vitae mi.',
    'quest_title_300': 'Quebrith discovered',
    'quest_desc_300':
        'Nunc pellentesque pellentesque sodales. Fusce vel lectus erat. Nullam pulvinar, erat pulvinar egestas ultrices, enim turpis condimentum urna, mollis porttitor mauris arcu vitae mi.',
    'quest_title_400': 'Aether discovered',
    'quest_desc_400':
        'Nunc pellentesque pellentesque sodales. Fusce vel lectus erat. Nullam pulvinar, erat pulvinar egestas ultrices, enim turpis condimentum urna, mollis porttitor mauris arcu vitae mi.',
    'quest_title_500': 'Vermilion discovered',
    'quest_desc_500':
        'Nunc pellentesque pellentesque sodales. Fusce vel lectus erat. Nullam pulvinar, erat pulvinar egestas ultrices, enim turpis condimentum urna, mollis porttitor mauris arcu vitae mi.',
    'quest_title_600': 'Materia optima discovered',
    'quest_desc_600':
        'Nunc pellentesque pellentesque sodales. Fusce vel lectus erat. Nullam pulvinar, erat pulvinar egestas ultrices, enim turpis condimentum urna, mollis porttitor mauris arcu vitae mi.',
  };

  static final LinkedHashMap<int, StoryEntry> storyEntries =
      LinkedHashMap.from({
    0: StoryEntry(
      titleKey: 'quest_title_0',
      descriptionKey: 'quest_desc_0',
      assetPath: 'patterns/rebis_recipe.png',
    ),
    100: StoryEntry(
      titleKey: 'quest_title_100',
      descriptionKey: 'quest_desc_100',
      assetPath: 'patterns/caeleum_recipe.png',
      compendiumColor: GameColors.green,
    ),
    200: StoryEntry(
      titleKey: 'quest_title_200',
      descriptionKey: 'quest_desc_200',
      assetPath: 'patterns/quebrith_recipe.png',
      compendiumColor: GameColors.blue,
    ),
    300: StoryEntry(
      titleKey: 'quest_title_300',
      descriptionKey: 'quest_desc_300',
      assetPath: 'patterns/aether_recipe.png',
      compendiumColor: GameColors.violet,
    ),
    400: StoryEntry(
      titleKey: 'quest_title_400',
      descriptionKey: 'quest_desc_400',
      assetPath: 'patterns/vermilion_recipe.png',
      compendiumColor: GameColors.orange,
    ),
    500: StoryEntry(
      titleKey: 'quest_title_500',
      descriptionKey: 'quest_desc_500',
      assetPath: 'patterns/materia_optima_recipe.png',
      compendiumColor: GameColors.yellow,
    ),
    600: StoryEntry(
      titleKey: 'quest_title_600',
      descriptionKey: 'quest_desc_600',
      compendiumColor: GameColors.white,
    ),
  });
}
