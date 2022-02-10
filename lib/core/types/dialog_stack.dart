import 'package:materia_optima/utils/story.dart';

class DialogStack {
  final List<StoryEntry> _list = [];

  void push(StoryEntry entry) => _list.add(entry);

  StoryEntry pop() => _list.removeLast();

  StoryEntry get front => _list.last;

  int get size => _list.length;
}
