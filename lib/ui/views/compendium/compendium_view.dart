import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:materia_optima/core/models/game_model.dart';
import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/ui/views/compendium/compendium_tab.dart';
import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/core/types/types.dart';

class CompendiumView extends StatefulWidget {
  const CompendiumView({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  _CompendiumViewState createState() => _CompendiumViewState();
}

class _CompendiumViewState extends State<CompendiumView> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widget.width,
        child: Consumer<GameModel>(
          // int currentQuestStage, int lastCompendiumListLength, VoidCallback<int> setLastCompendiumListLength
          // TODO: change to Selector?
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
                          width: widget.width,
                          color: GameColors.grey50,
                          entry: renderedEntries[index],
                        ),
                        const SizedBox(
                          height: 20.0,
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
