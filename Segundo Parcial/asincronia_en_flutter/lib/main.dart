import 'package:asincronia/services/mockapi.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'flashC.dart';
import 'directionsWalk.dart';
import 'airport_shuttle.dart';

void main() => runApp(const MyApp());
/*
APLICACIONES Móvil.
Nombres y Apellidos: Winter Aníbal Meza Jiménez.
Curso: Séptimo "A" 2022(2).
Práctica Guiada 2: Asincronia con Flutter.
Fecha: Domingo, 12 de diciembre de 2022.
Docente: Ing. Edgardo Panchana Flores, Mg.
 */
// Clase principal
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Asynchronous calls';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        backgroundColor: Colors.cyan.shade100,
        appBar: AppBar(title: const Text(_title)),
        body: const StateWidget(),
      ),
    );
  }
}

class StateWidget extends StatefulWidget {
  const StateWidget({super.key});

  @override
  State<StateWidget> createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  // Aqui se definen las diferentes propiedades con valores que viene por defecto.
  double _height = 50;
  double _width = 50;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  // Se actualiza dichas propiedades cuando
  // el usuario toque un FloatingActionButton.
  Widget build(BuildContext context) {
    return Material(
        child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

            const Text("Winter Meza Jiménez 7mo A ",
                style:
                TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold, color:Colors.indigo)),
            ListScreen(),
            airport_shuttle(),
            directions_walk(),
          ]),
    ));
  }
}
