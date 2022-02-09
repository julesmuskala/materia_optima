import 'package:flutter/material.dart';
import 'package:materia_optima/utils/theme.dart';

class AnimatedColorFiltered extends StatefulWidget {
  const AnimatedColorFiltered({
    Key? key,
    this.duration = GameTheme.standardAnimationDuration,
    required this.endColor,
    this.blendMode = GameTheme.standardBlendMode,
    required this.child,
  }) : super(key: key);

  final Duration duration;
  final Color endColor;
  final BlendMode blendMode;
  final Widget child;

  @override
  _AnimatedColorFilteredState createState() => _AnimatedColorFilteredState();
}

class _AnimatedColorFilteredState extends State<AnimatedColorFiltered> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: widget.duration,
      tween: ColorTween(
        end: widget.endColor,
      ),
      builder: (BuildContext context, value, Widget? child) {
        return ColorFiltered(
          colorFilter: ColorFilter.mode(
            value as Color,
            widget.blendMode,
          ),
          child: widget.child,
        );
      },
    );
  }
}
