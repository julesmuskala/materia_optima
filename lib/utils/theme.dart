import 'package:flutter/material.dart';

abstract class GameColors {
  static const white = Color.fromARGB(255, 255, 255, 255);
  static const green = Color.fromARGB(255, 35, 227, 141);
  static const blue = Color.fromARGB(255, 2, 167, 233);
  static const violet = Color.fromARGB(255, 165, 82, 226);
  static const orange = Color.fromARGB(255, 251, 113, 2);
  static const yellow = Color.fromARGB(255, 235, 233, 24);
  static const grey50 = Color.fromARGB(255, 173, 173, 173);
  static const grey100 = Color.fromARGB(255, 113, 113, 113);
  static const grey200 = Color.fromARGB(255, 18, 18, 18);
  static const shadowBlack = Color.fromARGB(115, 0, 0, 0);
}

abstract class GameTypography {
  static const String _fontFamily = 'RobotoCondensed';

  static const FontWeight _bold = FontWeight.w700;
  static const FontWeight _regular = FontWeight.w400;

  static const title = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: _bold,
    color: GameColors.white,
    fontSize: 36,
    shadows: <Shadow>[
      Shadow(
        color: GameColors.shadowBlack,
        blurRadius: 2,
        offset: Offset(1, 2),
      ),
    ],
  );

  static const subtitle = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: _regular,
    color: GameColors.grey50,
    fontSize: 20,
    shadows: <Shadow>[
      Shadow(
        color: GameColors.shadowBlack,
        blurRadius: 2,
        offset: Offset(1, 2),
      ),
    ],
  );

  static const paragraph = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: _regular,
    color: GameColors.grey50,
    fontSize: 14,
  );

  static TextStyle modifiedParagraph(Color color) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontWeight: _regular,
      color: color,
      fontSize: 14,
    );
  }

  static TextStyle displayParagraph(Color color) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontWeight: _regular,
      color: color,
      fontSize: 14,
      shadows: <Shadow>[
        Shadow(
          blurRadius: 10,
          color: Color.fromARGB(
            179,
            color.red,
            color.green,
            color.blue,
          ),
        ),
      ],
    );
  }

  static TextStyle elementTitle(Color color) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontWeight: _bold,
      color: GameColors.white,
      fontSize: 20,
      shadows: <Shadow>[
        Shadow(
          blurRadius: 10,
          color: Color.fromARGB(
            179,
            color.red,
            color.green,
            color.blue,
          ),
        ),
      ],
    );
  }
}

abstract class GameTheme {
  static const List<BoxShadow> boxShadow = [
    BoxShadow(
      color: GameColors.shadowBlack,
      blurRadius: 2,
      offset: Offset(1, 2),
    ),
  ];

  static const List<Shadow> shadow = [
    Shadow(
      color: GameColors.shadowBlack,
      blurRadius: 2,
      offset: Offset(1, 2),
    ),
  ];

  static LinearGradient gradient(Color color) {
    var colorAlpha50 = Color.fromARGB(127, color.red, color.green, color.blue);
    var colorAlpha10 = Color.fromARGB(25, color.red, color.green, color.blue);

    return LinearGradient(
      colors: [
        colorAlpha50,
        colorAlpha10,
        colorAlpha50,
      ],
      stops: const [0, 0.5, 1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  static final ThemeData data = ThemeData(
    // appBarTheme:
    backgroundColor: GameColors.grey200,
    // bottomAppBarTheme:
    // bottomNavigationBarTheme:
    // dialogTheme:
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.center,
        backgroundColor: MaterialStateProperty.all<Color>(GameColors.grey200),
        enableFeedback: true,
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 25.0,
          ),
        ),
        shadowColor: MaterialStateProperty.all<Color>(GameColors.shadowBlack),
        elevation: MaterialStateProperty.all<double>(15.0),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const ContinuousRectangleBorder(),
        ),
        side: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return const BorderSide(
              color: GameColors.grey100,
              width: 2.5,
            );
          }
          return const BorderSide(
            color: GameColors.grey50,
            width: 2.5,
          );
        }),
        // MaterialStateProperty.all<TextStyle>(GameTypography.paragraph)
        textStyle: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return GameTypography.modifiedParagraph(GameColors.grey100);
            }
            return GameTypography.paragraph;
          },
        ),
      ),
    ),
    // highlightColor:
    // hoverColor:
    // indicatorColor:
    // listTileTheme:
    // pageTransitionTheme:
    // primaryColor:
    scaffoldBackgroundColor: GameColors.grey200,
    // scrollbarTheme:
    // splashColor:
    // splashFactory:
    // textTheme: TextTheme(
    //   displayLarge: GameTypography.title,
    //   displaySmall: GameTypography.subtitle,
    //   bodyText1: GameTypography.paragraph,
    // ),
    // tooltipTheme:
  );
}
