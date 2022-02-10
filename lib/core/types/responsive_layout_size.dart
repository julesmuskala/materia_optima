enum ResponsiveLayoutSize {
  large,
  medium,
  small,
}

ResponsiveLayoutSize getLayoutSize(double screenSize) {
  if (screenSize >= 1440) {
    return ResponsiveLayoutSize.large;
  } else if (screenSize >= 1200) {
    return ResponsiveLayoutSize.medium;
  }
  return ResponsiveLayoutSize.small;
}
