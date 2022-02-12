import 'package:flutter/material.dart';

import 'package:materia_optima/core/types/responsive_layout.dart';

class ResponsiveLayoutBuilder extends StatelessWidget {
  const ResponsiveLayoutBuilder({
    Key? key,
    required this.landscape,
    required this.portrait,
    required this.tooSmall,
  }) : super(key: key);

  final Widget landscape;
  final Widget portrait;
  final Widget tooSmall;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (screenWidth >= ResponsiveLayoutBreakpoints.largeBreakpoint) {
          return landscape;
        } else if (screenWidth >= ResponsiveLayoutBreakpoints.smallBreakpoint) {
          return portrait;
        }
        return tooSmall;
      },
    );
  }
}
