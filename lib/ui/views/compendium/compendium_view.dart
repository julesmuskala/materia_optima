import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:materia_optima/core/models/game_model.dart';
import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/ui/views/compendium/compendium_tab.dart';
import 'package:materia_optima/core/types/types.dart';

class CompendiumView extends StatelessWidget {
  CompendiumView({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: Consumer<GameModel>(
          builder: (context, gameValue, child) {
            final renderedEntries = _filterUnlockedEntries(
              gameValue.currentQuestStage,
              lastEntriesLength: gameValue.lastCompendiumListLength,
              setLength: gameValue.setLastCompendiumListLength,
            );
            return AnimatedList(
              key: _listKey,
              shrinkWrap: true,
              initialItemCount: gameValue.lastCompendiumListLength,
              itemBuilder: (context, index, animation) {
                return FadeTransition(
                  opacity: animation.drive(
                    Tween<double>(
                      begin: 0,
                      end: 1,
                    ),
                  ),
                  child: SlideTransition(
                    position: animation.drive(
                      Tween<Offset>(
                        begin: const Offset(-0.01, 0),
                        end: const Offset(0, 0),
                      ),
                    ),
                    child: Column(
                      children: [
                        CompendiumTab(
                          width: width,
                          entry: renderedEntries[index],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  List<StoryEntry> _filterUnlockedEntries(
    int currentQuestStage, {
    required int lastEntriesLength,
    required VoidCallbackParam<int> setLength,
  }) {
    List<StoryEntry> returnedEntries = [];

    for (var entry in GameStory.storyEntries.entries) {
      if (entry.key <= currentQuestStage) {
        returnedEntries.add(entry.value);
      }
    }

    if (returnedEntries.length > lastEntriesLength) {
      for (var i = 0; i < returnedEntries.length - lastEntriesLength; i++) {
        _listKey.currentState?.insertItem(lastEntriesLength + i);
      }
    }

    setLength.call(returnedEntries.length);

    return returnedEntries;
  }
}
