import 'package:flutter/material.dart';

import 'core/constants.dart';
///Contiene temas relacionados a la app.
class AppTheme {
  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(
        //Color lo saque del documento entregado
        Constants.blueColor,
      ),
    ),
    //Los Componentes de material 3 se ven mejor que los de material 2,
    // pero el documento tiene los botones de material 2, así que.....
    useMaterial3: false,
    //tema de Input, usado en textFormField
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(),
    ),
    //Tema de AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(
        Constants.blueColor,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
      ),
    ),
    //Tema de boton Outlined
    outlinedButtonTheme: const OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(
          Colors.white,
        ),
        backgroundColor: MaterialStatePropertyAll(
          Color(Constants.blueColor),
        ),
      ),
    ),
  );
}
