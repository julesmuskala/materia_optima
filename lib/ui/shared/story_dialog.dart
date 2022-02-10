import 'package:flutter/material.dart';

import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/core/types/listened_keys.dart';
import 'package:materia_optima/ui/shared/fancy_button.dart';
import 'package:materia_optima/core/types/responsive_layout_size.dart';

class StoryDialog extends StatefulWidget {
  const StoryDialog({
    Key? key,
    required this.entry,
  }) : super(key: key);

  final StoryEntry entry;

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
    final screenSize = MediaQuery.of(context).size;

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
            padding: EdgeInsets.all(screenSize.height * 0.03),
            child: SizedBox(
              width: screenSize.width * 0.25,
              height: screenSize.height * 0.35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                        GameStory.lines[widget.entry.titleKey]?.toUpperCase() ??
                            'Error: no line found',
                        style: GameTypography.responsiveElementTitle(
                          getLayoutSize(screenSize.width),
                          GameColors.shadowBlack,
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.03,
                      ),
                      Text(
                        GameStory.lines[widget.entry.descriptionKey] ??
                            'Error: no line found',
                        style: GameTypography.responsiveParagraph(
                          getLayoutSize(screenSize.width),
                        ),
                        softWrap: true,
                      ),
                    ],
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
