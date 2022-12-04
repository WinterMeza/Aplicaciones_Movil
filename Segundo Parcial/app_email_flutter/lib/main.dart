import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens/list_screen.dart';
/*
APLICACIONES Móvil.
Nombres y Apellidos: Winter Aníbal Meza Jiménez.
Curso: Séptimo "A" 2022(2).
Práctica Guiada 1: Aplicación Mail en Flutter.
Fecha: Domingo, 4 de diciembre de 2022.
Docente: Ing. Edgardo Panchana Flores, Mg.
 */
// Clase principal.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ListScreen(title: 'Mock mail'),
    );
  }
}
