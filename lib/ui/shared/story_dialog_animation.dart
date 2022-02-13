import 'package:flutter/material.dart';

import 'package:materia_optima/utils/theme.dart';

class StoryDialogAnimation extends StatefulWidget {
  const StoryDialogAnimation({
    Key? key,
    required this.dialogContent,
  }) : super(key: key);

  final Widget dialogContent;

  @override
  State<StoryDialogAnimation> createState() => _StoryDialogAnimationState();
}

class _StoryDialogAnimationState extends State<StoryDialogAnimation>
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
        child: widget.dialogContent,
      ),
    );
  }
}
