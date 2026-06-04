import 'package:flutter/material.dart';

final appTheme = ThemeData(
  colorScheme: colorScheme,
  textTheme: textTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  inputDecorationTheme: textFieldTheme,
  checkboxTheme: checkboxTheme,
  appBarTheme: appBarTheme
);

// Define a custom color scheme for the app
final colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF4A3780),
  onPrimary: Color(0xFFFFFFFF),
  error: Color(0xFFB00020),
  onError: Color(0xFFFFFFFF),
  surface: Colors.grey[50]!,
  secondary: Color(0xFF4A3780),
  onSecondary: Color(0xFFFFFFFF),
  onSurface: Colors.black,
);

// Define a custom text theme for the app
final textTheme = TextTheme(
  displayLarge: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: "Inter28pt",
  ),
  displayMedium: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    fontFamily: "Inter24pt",
  ),
  displaySmall: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: "Inter18pt",
  ),
  headlineLarge: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    fontFamily: "Inter28pt",
  ),
  headlineMedium: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    fontFamily: "Inter24pt",
  ),
  headlineSmall: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: "Inter18pt",
  ),
  titleLarge: TextStyle(fontSize: 22, fontFamily: "Inter28pt"),
  titleMedium: TextStyle(fontSize: 18, fontFamily: "Inter24pt"),
  titleSmall: TextStyle(fontSize: 16, fontFamily: "Inter18pt"),
  bodyLarge: TextStyle(fontSize: 18, fontFamily: "Inter28pt"),
  bodyMedium: TextStyle(fontSize: 16, fontFamily: "Inter24pt"),
  bodySmall: TextStyle(fontSize: 14, fontFamily: "Inter18pt"),
  labelLarge: TextStyle(fontSize: 14, fontFamily: "Inter28pt"),
  labelMedium: TextStyle(fontSize: 12, fontFamily: "Inter24pt"),
  labelSmall: TextStyle(fontSize: 10, fontFamily: "Inter18pt"),
);

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: colorScheme.primary,
    foregroundColor: colorScheme.onPrimary,
    textStyle: textTheme.labelLarge,
    minimumSize: Size(double.infinity, 56),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
  ),
);

final textFieldTheme = InputDecorationThemeData(
  hintStyle: textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
  filled: true,
  fillColor: Colors.white,
  border: ShapedInputBorder(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
      side: BorderSide(color: Color(0xFFE0E0E0).withValues(alpha: 0.5)),
    ),
  ),
);

final checkboxTheme = CheckboxThemeData(
  fillColor: WidgetStateProperty.all(colorScheme.onPrimary),
  checkColor: WidgetStateProperty.all(colorScheme.onPrimary),
  shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(3)),
);

final appBarTheme = AppBarThemeData(
  backgroundColor: colorScheme.primary,
  elevation: 0,
  centerTitle: true,
  titleTextStyle: textTheme.headlineSmall?.copyWith(
    fontWeight: FontWeight.w600,
    color: colorScheme.onPrimary,
  ),
  iconTheme: IconThemeData(color: colorScheme.onPrimary, size: 24),
);
