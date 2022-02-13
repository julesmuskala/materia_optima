import 'dart:collection';
import 'package:flutter/material.dart';

import 'package:materia_optima/utils/theme.dart';

class StoryEntry {
  StoryEntry({
    required this.titleKey,
    required this.descriptionKey,
    this.compendiumColor,
    this.assetPath,
    this.rarity = 'common',
  });

  final String titleKey;
  final String descriptionKey;
  final Color? compendiumColor;
  final String? assetPath;
  final String rarity;
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
    'materia_incognita_desc': 'Who knows what it is?',
    'materia_prima_desc':
        'Materia prima is the most basic element all matter in our known universe is derived from. Its magical potency is very low and in order to be useful, it needs to be fused into heavier, superior elements.',
    'rebis_desc':
        'Rebis is the most basic of superior elements. Sometimes called “fool\'s meteria optima”, as it is the first element every beginner alchemist amalgamates. For its relatively low volatility and pleasant green glow, it is often used by lower classes in jewelry.',
    'caeleum_desc':
        'Caeleum is named after one of the islands of the Southern Archipelago, where during summer nights waves take on this element\'s brilliant blue hue and its glow.',
    'quebrith_desc':
        'Quebrith due to its purple color, so uncommon in nature and relative inaccessibility to the lower classes, is highly valued by the upper echelons. It is used in makeup, cosmetics, and even as food coloring. Although, it is also said to cause shortness of breath and skin reddening akin to sunburn.',
    'aether_desc':
        'Aether was the symbol of Konstantian Reformation. After the last of Great Reformers were executed, it was banned and its possession was punished by death. Today, aether is still heavily regulated but a license for its handling may be obtained by joining the Imperial Alchemy Revival Guild.',
    'vermilion_desc':
        'Vermilion is most well known for its strange scent. In small amounts, it has a fruity and floral, overall pleasant smell nonetheless when handled in higher amounts it reeks of decay and feces. Due to that property and the fact that vermilion odor lingers even for weeks, it is used as an aromatic substance in lavish perfumes.',
    'materia_optima_desc':
        'Materia optima is a pinnacle of creation, the most perfect element in the known universe.',
    // Story entries
    'quest_title_0': 'Welcome to Materia Optima',
    'quest_desc_0':
        'Materia optima is a game about discovery and achieving alchemical prowess. You can do it by arranging tiles on the board in special patterns. You can do it by clicking on a glowing tile that is adjacent to empty space. Try it out! And then try to arrange tiles in the pattern below.',
    'quest_title_100': 'Rebis discovered',
    'quest_desc_100':
        'All recipes in Materia optima (except for the first one) require the usage of superior elements. You can add them to the board in the inventory menu to the left. Try selecting Rebis by clicking on the green circle in the inventory menu and then adding it to the board by clicking on the button below. And then try to arrange tiles in the pattern below.',
    'quest_title_200': 'Caeleum discovered',
    'quest_desc_200': 'Cool! Now go on.',
    'quest_title_300': 'Quebrith discovered',
    'quest_desc_300': 'Cool! Now go on.',
    'quest_title_400': 'Aether discovered',
    'quest_desc_400': 'Cool! Now go on.',
    'quest_title_500': 'Vermilion discovered',
    'quest_desc_500': 'Cool! Now go on.',
    'quest_title_600': 'Materia optima discovered',
    'quest_desc_600':
        'Thank you very much for play-testing! Remember to fill out the form I provided. Cheers!',
    'helper_title_2137': 'Amalgamation failed',
    'helper_desc_2137':
        'Hey, that pattern is incomplete! You can always open previous dialogs in the compendium menu to the right, by clicking on its title.',
    'helper_title_6969': 'No more space on the board',
    'helper_desc_6969':
        'There is no free space left to fill with superior elements. You need to reset the board before adding any new element tiles.',
  };

  static String getLine(String key) => lines[key] ?? 'Error: no line found';

  static final LinkedHashMap<int, StoryEntry> storyEntries =
      LinkedHashMap.from({
    0: StoryEntry(
      titleKey: 'quest_title_0',
      descriptionKey: 'quest_desc_0',
      assetPath: 'patterns/rebis_recipe.webp',
    ),
    100: StoryEntry(
      titleKey: 'quest_title_100',
      descriptionKey: 'quest_desc_100',
      assetPath: 'patterns/caeleum_recipe.webp',
      compendiumColor: GameColors.green,
      rarity: 'uncommon',
    ),
    200: StoryEntry(
      titleKey: 'quest_title_200',
      descriptionKey: 'quest_desc_200',
      assetPath: 'patterns/quebrith_recipe.webp',
      compendiumColor: GameColors.blue,
      rarity: 'rare',
    ),
    300: StoryEntry(
      titleKey: 'quest_title_300',
      descriptionKey: 'quest_desc_300',
      assetPath: 'patterns/aether_recipe.webp',
      compendiumColor: GameColors.violet,
      rarity: 'unique',
    ),
    400: StoryEntry(
      titleKey: 'quest_title_400',
      descriptionKey: 'quest_desc_400',
      assetPath: 'patterns/vermilion_recipe.webp',
      compendiumColor: GameColors.orange,
      rarity: 'exceptional',
    ),
    500: StoryEntry(
      titleKey: 'quest_title_500',
      descriptionKey: 'quest_desc_500',
      assetPath: 'patterns/materia_optima_recipe.webp',
      compendiumColor: GameColors.yellow,
      rarity: 'legendary',
    ),
    600: StoryEntry(
      titleKey: 'quest_title_600',
      descriptionKey: 'quest_desc_600',
      compendiumColor: GameColors.white,
      rarity: 'optima',
    ),
    2137: StoryEntry(
      titleKey: 'helper_title_2137',
      descriptionKey: 'helper_desc_2137',
    ),
    6969: StoryEntry(
      titleKey: 'helper_title_6969',
      descriptionKey: 'helper_desc_6969',
    ),
  });
}
