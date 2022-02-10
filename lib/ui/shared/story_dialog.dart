import 'package:flutter/material.dart';

import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/core/types/listened_keys.dart';
import 'package:materia_optima/ui/shared/fancy_button.dart';

class StoryDialog extends StatefulWidget {
  const StoryDialog({
    Key? key,
    required this.entry,
    required this.width,
  }) : super(key: key);

  final StoryEntry entry;
  final double width;

  @override
  _StoryDialogState createState() => _StoryDialogState();
}

class _StoryDialogState extends State<StoryDialog>
    with TickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: GameTheme.standardAnimationDuration,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.reverse();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation.drive(
        Tween<Offset>(
          begin: const Offset(0, 0.01),
          end: const Offset(0, 0),
        ),
      ),
      child: FadeTransition(
        opacity: _animation,
        child: Dialog(
          backgroundColor: GameColors.grey200,
          shape: const ContinuousRectangleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: SizedBox(
              width: widget.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    GameStory.lines[widget.entry.titleKey]?.toUpperCase() ??
                        'Error: no line found',
                    style: GameTypography.elementTitle(GameColors.shadowBlack),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    GameStory.lines[widget.entry.descriptionKey] ??
                        'Error: no line found',
                    style: GameTypography.paragraph,
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  FancyButton(
                    listenedKey: ListenedKeys.xKey,
                    description: 'Close',
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
