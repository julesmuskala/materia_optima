enum ResponsiveLayoutSize {
  large,
  medium,
  small,
  extraSmall,
}

abstract class ResponsiveLayoutBreakpoints {
  static double largeBreakpoint = 1440;
  static double mediumBreakpoint = 1200;
  static double smallBreakpoint = 310;

  static ResponsiveLayoutSize getLayoutSize(double screenSize) {
    if (screenSize >= largeBreakpoint) {
      return ResponsiveLayoutSize.large;
    } else if (screenSize >= mediumBreakpoint) {
      return ResponsiveLayoutSize.medium;
    } else if (screenSize >= smallBreakpoint) {
      return ResponsiveLayoutSize.small;
    }

    return ResponsiveLayoutSize.extraSmall;
  }
}
