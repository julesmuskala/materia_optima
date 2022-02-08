// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:materia_optima/utils/theme.dart';
// import 'package:materia_optima/core/models/game_model.dart';
// import 'package:materia_optima/utils/story.dart';
// import 'package:materia_optima/ui/views/compendium/compendium_tab.dart';

// class CompendiumView extends StatefulWidget {
//   const CompendiumView({
//     Key? key,
//     required this.width,
//   }) : super(key: key);

//   final double width;

//   @override
//   _CompendiumViewState createState() => _CompendiumViewState();
// }

// class _CompendiumViewState extends State<CompendiumView> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SizedBox(
//         width: widget.width,
//         child: Consumer<GameModel>(
//           builder: (context, gameValue, child) {
//             final List<StoryEntry> renderedEntries =
//                 _filterUnlockedEntries(gameValue.currentQuestStage);
//             return ListView.separated(
//               shrinkWrap: true,
//               itemCount: renderedEntries.length,
//               itemBuilder: (BuildContext context, int index) {
//                 var entry = renderedEntries[index];
//                 print(entry.toString());
//                 return CompendiumTab(
//                   width: widget.width,
//                   color: GameColors.grey50,
//                   text: 'test',
//                 );
//                 // return const Placeholder();
//               },
//               separatorBuilder: (BuildContext context, int index) =>
//                   const Divider(height: 20.0),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   List<StoryEntry> _filterUnlockedEntries(int currentQuestStage) {
//     List<StoryEntry> entries = [];

//     for (var entry in GameStory.storyEntries.entries) {
//       if (entry.key > currentQuestStage) break;
//       entries.add(entry.value);
//     }

//     return entries;
//   }
// }
