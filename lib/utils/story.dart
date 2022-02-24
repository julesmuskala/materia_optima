import 'dart:collection';
import 'package:flutter/material.dart';

import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/core/types/alchemy_element.dart';

class StoryEntry {
  StoryEntry({
    required this.titleKey,
    required this.descriptionKey,
    this.compendiumColor = GameColors.grey50,
    this.assetPath,
    this.rarity = 'common',
    this.followUpStage,
    this.unlockedElement,
    this.audioPath,
  });

  final String titleKey;
  final String descriptionKey;
  final Color compendiumColor;
  final String? assetPath;
  final String rarity;
  final int? followUpStage;
  final AlchemyElement? unlockedElement;
  final String? audioPath;
}

abstract class GameStory {
  static const Map<String, String> lines = {
    'error_fallback': 'Error: provided key is null',
    'app_title': 'Materia Optima',
    'app_subtitle': 'Achieve alchemical prowess',
    'screen_too_small':
        'The most unfortunate part is that this screen is too small to be supported...\n😢',
    'repo_link': 'You can find source code and credits on GitHub.',
    // Semantic
    'finish_board': 'Start amalgamation',
    'reset_board': 'Clear board',
    'close_dialog': 'Close',
    // Materia descriptions
    'materia_nulla_desc': 'Error: How?',
    'materia_incognita_desc': 'Who knows what it is?',
    'materia_prima_desc':
        'Materia prima is the most basic materia, underlying all the known alchemy. It has low magical potency, thus in order to be alchemically useful it needs to be amalgamated into more reactive materiae.\nAlthough it is relatively abundant, due to its gray coloring it is often overlooked as a non-magical mineral.\nMateria prima is said to come from cores of falling stars.',
    'rebis_desc':
        'Rebis can be found in minuscule amounts in the roots of aquatic plants. Because of that, it is much more viable to produce it by amalgamation.\nIt was traditionally assumed that it is a by-product of plant existence, however in light of recent discovery of animalcules*, some scholars suggested that rebis may be produced by them.\nWhen consumed, it has a stimulating effect and can delay sleep. \n\n* Animalcules – little animals, floating in the air and water, can be only observed under a telescope.',
    'caeleum_desc':
        'Caeleum, as rebis, can be found in nature in aquatic environments. It is produced and almost instantly consumed by plant-like animalcules living in the coastal seas of the Southern Archipelago. The highest amounts of those creatures can be spotted in the summer in the coastal waters of the Island of Caeleum (after which this materia takes its name).\nBecause it quickly flashes into existence, there is no viable method of natural extraction.',
    'quebrith_desc':
        'Quebrith is highly toxic materia, that can be only produced by amalgamation. Due to its connotations with the mass suicide during the siege of Ekielsk it has been either outlawed or highly regulated in all the kingdoms and commonwealths.\nWhen consumed it causes nausea then stopping the hearth action. There is no known antidote, however many alchemists seem to develop immunity.',
    'aether_desc':
        'Aether just like quebrith can not be found in nature and requires amalgamation to obtain it. In small amounts, aether has a calming effect and is often used to treat pain, anxiety, anguish and seizures. Nonetheless, in higher amounts it causes amnesia, paranoia, aggression and shortness of breath, sometimes resulting in death due to lack of the air.',
    'vermilion_desc':
        'Vermilion naturally can be found in trace amounts in dried fruit, especially in golden raspberries and cream cherries. Currently, there are industrial efforts to develop ways to source vermilion this way, instead of traditionally used amalgamation.\nIn small amounts, it has a pleasant fruity smell, often used in perfumes. Yet in higher amounts it reeks of decay and feces.',
    'materia_optima_desc':
        'Materia optima is the most difficult materia to amalgamate. Most alchemists spend years of training just to be able to gather enough power to accomplish the amalgamation process. \nIt has a strong effect on memory and enables its user to learn much quicker. Nonetheless, when mishandled it can wipe memory clean in a few hours, therefore it is given only to promising alchemy apprentices to minimize the risk.',
    // Story entries
    'quest_title_0': 'Welcome to Materia optima',
    'quest_desc_0':
        'Materia optima is a game about discovery and achieving alchemical prowess. You can do it by arranging tiles on the board in special patterns. You can do it by clicking on a glowing tile that is adjacent to empty space.\n',
    'quest_title_50': 'First assignment',
    'quest_desc_50':
        '“Everyone runs, no one walks or talks in vain. I lost my smell from all the soot I have been breathing in from all that candle burning I do overnights. I have barely slept - no time for that, king’s army shall be at Peterlin any time now. \nYour dear friend, \nCv.”\nIn the envelope, you find a small picture. You memorize it quickly, as it fades before completely vanishing to the thin air.\nWhen you are finished with arranging the pattern, remember to proceed with amalgamation.',
    'quest_title_100': 'Rebis discovered',
    'quest_desc_100':
        'Most recipes in Materia optima require the usage of superior materiae. To add them to the board, select materia icons in the Inventory tab (to the left) then proceed by clicking the appropriate button. \nYou can always open unlocked dialogs by clicking on their title in the Compendium tab (to the right).',
    'quest_title_150': 'Battle of Peterlin',
    'quest_desc_150':
        '“You should have seen their faces, the purest fear. I do not enjoy killing and neither does our Heavenly Lady Yellieux, but sometimes there is a merit in it. Franzians won, mister Franz’s sacrifice was not in vain.\nAs I said before, good sir Octave is a wonderful leader. Although hails from the Southern Archipelago, he was one of the first Franzians. His zeal is immense, and that is what really matters. \nYour dear friend,\nCv.”\nAnd so does this pattern, you think, as you take one last good look at it as it fades.',
    'quest_title_200': 'Caeleum discovered',
    'quest_desc_200':
        '“Although decisive, the Peterlin skirmish did little to further the franzian cause. The true power in the region lay with the city of Ekielsk. Ruled by a baroness who adopted the franzian teaching even before the heretic’s execution, it was a perfect spot for the Royal Army’s siege.”\n— Reymond the Elder, “Francian revolt”',
    'quest_title_250': 'Ekielsk siege',
    'quest_desc_250':
        '“I do not know what will be next. How long will it take? Indeed, we are the most stubborn and determined of all, but even then, I am not sure whether spirit is enough to saturate the body. Fortunately, other resources are not as scarce. Every day, I amalgamate stupendous amounts of quebrith, so when the dire time comes, everyone can pass with honor, as did mister Franz…”',
    'quest_title_300': 'Quebrith discovered',
    'quest_desc_300':
        '“Your Grace,\nEkielsk fell at dawn, when watchmen entered my tent with news of the city gate wide open. At first, we proceeded with caution, sending only the swiftest scouts. When they returned, telling us that Ekielsk fell indeed, we entered. What I have seen can only be described as gruesome. \nMany of my good men either cried or put down their arms. I could not have done anything about it, as the war is over, and so is the heresy.”',
    'quest_title_320': 'Am I? No, it can not be…',
    'quest_desc_320':
        '“Our food would only last for a day or two, and then? We would just slowly starve to death. Baroness was a friend of mister Franz and told us that good mister was starkly opposed to needless suffering, and told all of us to consume quebrith.\nIt happened before dawn, after a meager feast organized in the town square. I felt as if I drank a lot, but I did not feel nauseous nor sickly.”',
    'quest_title_360': 'Yes, I am.',
    'quest_desc_360':
        '“When everyone started to drop like flies, I realized - I was immune. I took some Aether to ease my conscience, opened the gate to create a distraction and ran away.”',
    'quest_title_400': 'Aether discovered',
    'quest_desc_400':
        '“When the news of Ekielsk’s fall started to circulate, many of the peasants, hitherto adhering to Franzian teachings, started to doubt it. With the help of bishops favorable towards orthodoxy and royalty, this doubt was turned into distrust and later - hatred.”\n— Jan Skalicjan, “A word about our southern neighbors”',
    'quest_title_450': 'Ideals rejected',
    'quest_desc_450':
        '“After my arrival to Rokitin, I tried to stay as far away from arcane alchemy as possible. I stopped cutting my hair, bathed less often, did all to blend in with townsfolk. I started apothecary, made some coin and after some time I started to feel at home. Until one day, when a nobleman came in. He asked for vermillion perfumes, placing a sizable coin purse on the counter. Greed got me.”',
    'quest_title_500': 'Vermilion discovered',
    'quest_desc_500':
        '“It was later discovered that Rokitin victim was Martin von Konstantz, son of a relatively wealthy nobleman, passing through the town to find an engagement gift. While mounting his horse, a vial of vermilion fell out of his pouch, shattering on the street cobbles. In large amounts, Vermilion has a foul lingering odor that was misattributed to odorless but poisonous quebrith. With the events that occurred in Ekielsk, fresh in public memory, Martin became a victim of a lynch mob.”\n— Barbara Schaff, “Encyclopedia criminalis”',
    'quest_title_550': 'Drink to forget',
    'quest_desc_550':
        '“As my alchemical journey started with materia optima, it will also end with it.”',
    'quest_title_600': 'Until there is no end',
    'quest_desc_600':
        'As you start the amalgamation process, you start to feel a bit dizzy. When suddenly…',
    'quest_title_650': 'What have just happened?',
    'quest_desc_650': 'What has just happened? I… I don’t remember. Do you?',
    'helper_title_2137': 'Amalgamation failed',
    'helper_desc_2137':
        'Until the alchemical pattern is fully complete, conducting amalgamation is extremely dangerous. Attempting it is foolish.',
    'helper_title_6969': 'No more space on the board',
    'helper_desc_6969':
        'There is no more Materia prima on the board to replace. You can try to clear it, before adding anything more again.',
  };

  static String getLine(String key) => lines[key] ?? 'Error: no line found';

  static final LinkedHashMap<int, StoryEntry> storyEntries =
      LinkedHashMap.from({
    0: StoryEntry(
      titleKey: 'quest_title_0',
      descriptionKey: 'quest_desc_0',
      followUpStage: 50,
    ),
    50: StoryEntry(
      titleKey: 'quest_title_50',
      descriptionKey: 'quest_desc_50',
      assetPath: 'patterns/rebis_recipe.webp',
      audioPath: 'effect_50.mp3',
    ),
    100: StoryEntry(
      titleKey: 'quest_title_100',
      descriptionKey: 'quest_desc_100',
      compendiumColor: GameColors.green,
      followUpStage: 150,
      rarity: 'uncommon',
      unlockedElement: AlchemyElement.rebis,
    ),
    150: StoryEntry(
      titleKey: 'quest_title_150',
      descriptionKey: 'quest_desc_150',
      assetPath: 'patterns/caeleum_recipe.webp',
      audioPath: 'effect_150.mp3',
    ),
    200: StoryEntry(
      titleKey: 'quest_title_200',
      descriptionKey: 'quest_desc_200',
      compendiumColor: GameColors.blue,
      followUpStage: 250,
      rarity: 'rare',
      unlockedElement: AlchemyElement.caeleum,
    ),
    250: StoryEntry(
      titleKey: 'quest_title_250',
      descriptionKey: 'quest_desc_250',
      assetPath: 'patterns/quebrith_recipe.webp',
      audioPath: 'effect_250.mp3',
    ),
    300: StoryEntry(
      titleKey: 'quest_title_300',
      descriptionKey: 'quest_desc_300',
      compendiumColor: GameColors.violet,
      followUpStage: 320,
      rarity: 'unique',
      unlockedElement: AlchemyElement.quebrith,
      audioPath: 'effect_300.mp3',
    ),
    320: StoryEntry(
      titleKey: 'quest_title_320',
      descriptionKey: 'quest_desc_320',
      followUpStage: 360,
      audioPath: 'effect_320.mp3',
    ),
    360: StoryEntry(
      titleKey: 'quest_title_360',
      descriptionKey: 'quest_desc_360',
      assetPath: 'patterns/aether_recipe.webp',
    ),
    400: StoryEntry(
      titleKey: 'quest_title_400',
      descriptionKey: 'quest_desc_400',
      compendiumColor: GameColors.orange,
      rarity: 'exceptional',
      followUpStage: 450,
      unlockedElement: AlchemyElement.aether,
    ),
    450: StoryEntry(
      titleKey: 'quest_title_450',
      descriptionKey: 'quest_desc_450',
      assetPath: 'patterns/vermilion_recipe.webp',
      audioPath: 'effect_450.mp3',
    ),
    500: StoryEntry(
      titleKey: 'quest_title_500',
      descriptionKey: 'quest_desc_500',
      compendiumColor: GameColors.yellow,
      rarity: 'legendary',
      followUpStage: 550,
      unlockedElement: AlchemyElement.vermilion,
    ),
    550: StoryEntry(
      titleKey: 'quest_title_550',
      descriptionKey: 'quest_desc_550',
      assetPath: 'patterns/materia_optima_recipe.webp',
    ),
    600: StoryEntry(
      titleKey: 'quest_title_600',
      descriptionKey: 'quest_desc_600',
      compendiumColor: GameColors.white,
      rarity: 'optima',
      followUpStage: 650,
      unlockedElement: AlchemyElement.materiaOptima,
    ),
    650: StoryEntry(
      titleKey: 'quest_title_650',
      descriptionKey: 'quest_desc_650',
      compendiumColor: GameColors.white,
      rarity: 'optima',
      audioPath: 'effect_650.mp3',
    ),
    2137: StoryEntry(
      titleKey: 'helper_title_2137',
      descriptionKey: 'helper_desc_2137',
      audioPath: 'effect_fail.mp3',
    ),
    6969: StoryEntry(
      titleKey: 'helper_title_6969',
      descriptionKey: 'helper_desc_6969',
      audioPath: 'effect_fail.mp3',
    ),
  });
}
