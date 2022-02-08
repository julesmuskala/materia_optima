import 'dart:collection';

class StoryEntry {
  StoryEntry({
    required this.titleKey,
    required this.descriptionKey,
    this.assetPath,
  });

  final String titleKey;
  final String descriptionKey;
  final String? assetPath;
}

abstract class GameStory {
  static const Map<String, String> lines = {
    'app_title': 'Materia Optima',
    'app_subtitle': 'by Juliusz Muskala',
    // Semantic
    'finish_board': 'Start amalgamation',
    'reset_board': 'Clear board',
    // Element descriptions
    'materia_nulla_desc': 'Wow, just wow! How did you...',
    'materia_prima_desc':
        'Nullam pulvinar volutpat ex, at molestie justo rutrum in. Ut vel justo vitae nisl pellentesque pharetra in id ante. Sed mattis felis dolor, in venenatis turpis efficitur aliquet. Curabitur fermentum, magna tempor fermentum aliquet, turpis elit cursus dui, iaculis commodo sem felis vitae neque.',
    // Story entries
    'quest_title_0': 'Welcome to Materia Optima',
    'quest_desc_0':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis placerat, enim nec varius blandit, mi dui interdum orci.',
    'quest_title_10': 'First assignment',
    'quest_desc_10':
        'Aenean ut ex tellus. Nam ac arcu a lorem aliquam blandit. Vestibulum libero massa.',
    'quest_title_100': 'Rebis discovered',
    'quest_desc_100':
        'Nunc pellentesque pellentesque sodales. Fusce vel lectus erat. Nullam pulvinar, erat pulvinar egestas ultrices, enim turpis condimentum urna, mollis porttitor mauris arcu vitae mi.',
  };

  static final LinkedHashMap<int, StoryEntry> storyEntries =
      LinkedHashMap.from({
    0: StoryEntry(
      titleKey: 'quest_title_0',
      descriptionKey: 'quest_desc_0',
    ),
    10: StoryEntry(
      titleKey: 'quest_title_10',
      descriptionKey: 'quest_desc_10',
    ),
    100: StoryEntry(
      titleKey: 'quest_entry_100',
      descriptionKey: 'quest_entry_100',
    ),
  });
}
