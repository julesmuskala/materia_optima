import 'package:materia_optima/utils/story.dart';

class DialogStack {
  final List<StoryEntry> _list = [];

  void push(StoryEntry entry) => _list.add(entry);

  StoryEntry pop() => _list.removeLast();

  int get size => _list.length;
}

// TODO: add semaphore to GameModel
