import 'package:flutter/material.dart';

import 'colors_app.dart';

class ThemesApp {
  // Theme para personalizado propietario
  static ThemeData themeBaseLigth = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: ColorsApp.seedLightPropietario,
    //brightness: Brightness.light,
    iconTheme: const IconThemeData(color: ColorsApp.greyIcon),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsApp.seedLightPropietario,
      foregroundColor: ColorsApp.secondLightPropietario,
      iconTheme: const IconThemeData(color: ColorsApp.secondLightPropietario),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorsApp.secondLightPropietario, //color del cursor
      selectionColor: ColorsApp.secondLightOpacityPropietario, //color del area seleccionada
      selectionHandleColor: ColorsApp.secondLightPropietario, //color de la gota bajo el cursor
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: ColorsApp.whiteBackground,
      shadowColor: ColorsApp.greyInactive,
      surfaceTintColor: ColorsApp.whiteBackground,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.seedLightPropietario,
      primary: ColorsApp.primaryLightPropietario,
      secondary: ColorsApp.secondLightPropietario,
      //onSecondary: ColorsApp.secondLightOpacityPropietario,
      tertiary: ColorsApp.tertiaryLightPropietario,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsApp.seedLightPropietario,
      selectedItemColor: ColorsApp.secondLightPropietario,
      unselectedItemColor: ColorsApp.greyIcon,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    scaffoldBackgroundColor: ColorsApp.seedLightPropietario,
    cardColor: ColorsApp.whiteBackground,
    fontFamily: 'Lato',
  );

  static ThemeData themeBaseDark = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: ColorsApp.seedDarkPropietario,
    //brightness: Brightness.dark,
    iconTheme: const IconThemeData(color: ColorsApp.whiteBackground),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsApp.seedDarkPropietario,
      foregroundColor: ColorsApp.primaryDarkPropietario,
      iconTheme: const IconThemeData(color: ColorsApp.primaryDarkPropietario),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorsApp.primaryDarkPropietario, //color del cursor
      selectionColor: ColorsApp.primaryDarkOpacituPropietario, //color del area seleccionada
      selectionHandleColor: ColorsApp.primaryDarkPropietario, //color de la gota bajo el cursor
    ),
    /*textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white),
      labelLarge: TextStyle(color: Colors.white),
    ),*/
    dialogTheme: DialogThemeData(
      backgroundColor: ColorsApp.greyInactive,
      shadowColor: ColorsApp.greyIcon,
      barrierColor: ColorsApp.primaryDarkPropietario,
      //surfaceTintColor: ColorsApp.whiteBackground,
      titleTextStyle: TextStyle(color: ColorsApp.primaryDarkPropietario, fontWeight: FontWeight.bold, fontSize: 20),
      contentTextStyle: TextStyle(color: ColorsApp.primaryDarkPropietario),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.seedDarkPropietario,
      primary: ColorsApp.primaryDarkPropietario,
      secondary: ColorsApp.secondDarkPropietario,
      tertiary: ColorsApp.tertiaryDarkPropietario,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsApp.seedDarkPropietario,
      selectedItemColor: ColorsApp.primaryDarkPropietario,
      unselectedItemColor: ColorsApp.greyInactive,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    scaffoldBackgroundColor: ColorsApp.seedLightPropietario,
    cardColor: ColorsApp.primaryDarkPropietario,
    fontFamily: 'Lato',
  );
}
