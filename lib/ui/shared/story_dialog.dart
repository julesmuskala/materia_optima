import 'package:flutter/material.dart';

import 'package:materia_optima/utils/theme.dart';
import 'package:materia_optima/utils/story.dart';
import 'package:materia_optima/core/types/listened_keys.dart';
import 'package:materia_optima/ui/shared/fancy_button.dart';

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
          shape: const ContinuousRectangleBorder(
            side: BorderSide(
              color: GameColors.grey50,
              width: 2.5,
            ),
          ),
          child: Container(
            width: screenSize.width * 0.87,
            constraints: const BoxConstraints(
              maxWidth: 450.0,
            ),
            child: Padding(
              padding: EdgeInsets.all(screenSize.height * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        GameStory.getLine(widget.entry.titleKey).toUpperCase(),
                        style: GameTypography.elementTitle(
                          GameColors.shadowBlack,
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.03,
                      ),
                      Text(
                        GameStory.getLine(widget.entry.descriptionKey),
                        style: GameTypography.paragraph,
                        softWrap: true,
                      ),
                      SizedBox(
                        height: screenSize.height * 0.03,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      widget.entry.assetPath != null
                          ? Image.asset(
                              'assets/${widget.entry.assetPath}',
                              height: screenSize.height * 0.12,
                              width: screenSize.height * 0.12,
                              filterQuality: FilterQuality.medium,
                            )
                          : const SizedBox(
                              height: 0.0,
                              width: 0.0,
                            ),
                      SizedBox(
                        height: screenSize.height * 0.03,
                      ),
                      FancyButton(
                        listenedKey: ListenedKeys.xKey,
                        description: GameStory.getLine('close_dialog'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
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
