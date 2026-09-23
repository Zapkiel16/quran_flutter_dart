import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1f642e),
      surfaceTint: Color(0xff286b34),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff3a7d44),
      onPrimaryContainer: Color(0xffd5ffd3),
      secondary: Color(0xff4b654b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffccebc9),
      onSecondaryContainer: Color(0xff506b50),
      tertiary: Color(0xff005d83),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff0877a5),
      onTertiaryContainer: Color(0xffebf5ff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff7faf2),
      onSurface: Color(0xff191d18),
      onSurfaceVariant: Color(0xff40493f),
      outline: Color(0xff707a6e),
      outlineVariant: Color(0xffc0c9bc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d312c),
      inversePrimary: Color(0xff90d794),
      primaryFixed: Color(0xffabf4ae),
      onPrimaryFixed: Color(0xff002107),
      primaryFixedDim: Color(0xff90d794),
      onPrimaryFixedVariant: Color(0xff07521f),
      secondaryFixed: Color(0xffccebc9),
      onSecondaryFixed: Color(0xff08200c),
      secondaryFixedDim: Color(0xffb1ceae),
      onSecondaryFixedVariant: Color(0xff334d34),
      tertiaryFixed: Color(0xffc6e7ff),
      onTertiaryFixed: Color(0xff001e2d),
      tertiaryFixedDim: Color(0xff83cfff),
      onTertiaryFixedVariant: Color(0xff004c6b),
      surfaceDim: Color(0xffd8dbd3),
      surfaceBright: Color(0xfff7faf2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f5ed),
      surfaceContainer: Color(0xffecefe7),
      surfaceContainerHigh: Color(0xffe6e9e1),
      surfaceContainerHighest: Color(0xffe0e4dc),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff004015),
      surfaceTint: Color(0xff286b34),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff387b42),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff233c25),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff597459),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003a54),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff0075a2),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff7faf2),
      onSurface: Color(0xff0e120e),
      onSurfaceVariant: Color(0xff30382f),
      outline: Color(0xff4c554a),
      outlineVariant: Color(0xff667064),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d312c),
      inversePrimary: Color(0xff90d794),
      primaryFixed: Color(0xff387b42),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff1c612c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff597459),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff415b42),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff0075a2),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff005b80),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc4c8c0),
      surfaceBright: Color(0xfff7faf2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f5ed),
      surfaceContainer: Color(0xffe6e9e1),
      surfaceContainerHigh: Color(0xffdbded6),
      surfaceContainerHighest: Color(0xffcfd3cb),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003410),
      surfaceTint: Color(0xff286b34),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff0b5521),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff19311b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff364f37),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003045),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff004f6f),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff7faf2),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff262e25),
      outlineVariant: Color(0xff434b41),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d312c),
      inversePrimary: Color(0xff90d794),
      primaryFixed: Color(0xff0b5521),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003c13),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff364f37),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff203821),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff004f6f),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff00374f),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb6bab3),
      surfaceBright: Color(0xfff7faf2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff2ea),
      surfaceContainer: Color(0xffe0e4dc),
      surfaceContainerHigh: Color(0xffd2d6ce),
      surfaceContainerHighest: Color(0xffc4c8c0),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff90d794),
      surfaceTint: Color(0xff90d794),
      onPrimary: Color(0xff003912),
      primaryContainer: Color(0xff3a7d44),
      onPrimaryContainer: Color(0xffd5ffd3),
      secondary: Color(0xffb1ceae),
      onSecondary: Color(0xff1d361f),
      secondaryContainer: Color(0xff334d34),
      onSecondaryContainer: Color(0xffa0bd9e),
      tertiary: Color(0xff83cfff),
      onTertiary: Color(0xff00344b),
      tertiaryContainer: Color(0xff0877a5),
      onTertiaryContainer: Color(0xffebf5ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff101410),
      onSurface: Color(0xffe0e4dc),
      onSurfaceVariant: Color(0xffc0c9bc),
      outline: Color(0xff8a9387),
      outlineVariant: Color(0xff40493f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e4dc),
      inversePrimary: Color(0xff286b34),
      primaryFixed: Color(0xffabf4ae),
      onPrimaryFixed: Color(0xff002107),
      primaryFixedDim: Color(0xff90d794),
      onPrimaryFixedVariant: Color(0xff07521f),
      secondaryFixed: Color(0xffccebc9),
      onSecondaryFixed: Color(0xff08200c),
      secondaryFixedDim: Color(0xffb1ceae),
      onSecondaryFixedVariant: Color(0xff334d34),
      tertiaryFixed: Color(0xffc6e7ff),
      onTertiaryFixed: Color(0xff001e2d),
      tertiaryFixedDim: Color(0xff83cfff),
      onTertiaryFixedVariant: Color(0xff004c6b),
      surfaceDim: Color(0xff101410),
      surfaceBright: Color(0xff363a35),
      surfaceContainerLowest: Color(0xff0b0f0b),
      surfaceContainerLow: Color(0xff191d18),
      surfaceContainer: Color(0xff1d211c),
      surfaceContainerHigh: Color(0xff272b26),
      surfaceContainerHighest: Color(0xff323631),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa6eda9),
      surfaceTint: Color(0xff90d794),
      onPrimary: Color(0xff002d0c),
      primaryContainer: Color(0xff5ca062),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffc6e4c3),
      onSecondary: Color(0xff122b15),
      secondaryContainer: Color(0xff7c987b),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffb9e2ff),
      onTertiary: Color(0xff00293c),
      tertiaryContainer: Color(0xff4299c9),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff101410),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd6dfd1),
      outline: Color(0xffabb5a8),
      outlineVariant: Color(0xff8a9387),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e4dc),
      inversePrimary: Color(0xff095420),
      primaryFixed: Color(0xffabf4ae),
      onPrimaryFixed: Color(0xff001604),
      primaryFixedDim: Color(0xff90d794),
      onPrimaryFixedVariant: Color(0xff004015),
      secondaryFixed: Color(0xffccebc9),
      onSecondaryFixed: Color(0xff001504),
      secondaryFixedDim: Color(0xffb1ceae),
      onSecondaryFixedVariant: Color(0xff233c25),
      tertiaryFixed: Color(0xffc6e7ff),
      onTertiaryFixed: Color(0xff00131f),
      tertiaryFixedDim: Color(0xff83cfff),
      onTertiaryFixedVariant: Color(0xff003a54),
      surfaceDim: Color(0xff101410),
      surfaceBright: Color(0xff414640),
      surfaceContainerLowest: Color(0xff050805),
      surfaceContainerLow: Color(0xff1b1f1a),
      surfaceContainer: Color(0xff252924),
      surfaceContainerHigh: Color(0xff30342e),
      surfaceContainerHighest: Color(0xff3b3f39),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc3ffc3),
      surfaceTint: Color(0xff90d794),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff8dd391),
      onPrimaryContainer: Color(0xff000f02),
      secondary: Color(0xffdaf8d6),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffadcaab),
      onSecondaryContainer: Color(0xff000f02),
      tertiary: Color(0xffe3f2ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff7accfe),
      onTertiaryContainer: Color(0xff000d16),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff101410),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe9f3e5),
      outlineVariant: Color(0xffbcc5b8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e4dc),
      inversePrimary: Color(0xff095420),
      primaryFixed: Color(0xffabf4ae),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff90d794),
      onPrimaryFixedVariant: Color(0xff001604),
      secondaryFixed: Color(0xffccebc9),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb1ceae),
      onSecondaryFixedVariant: Color(0xff001504),
      tertiaryFixed: Color(0xffc6e7ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff83cfff),
      onTertiaryFixedVariant: Color(0xff00131f),
      surfaceDim: Color(0xff101410),
      surfaceBright: Color(0xff4d514b),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1d211c),
      surfaceContainer: Color(0xff2d312c),
      surfaceContainerHigh: Color(0xff383d37),
      surfaceContainerHighest: Color(0xff444842),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

