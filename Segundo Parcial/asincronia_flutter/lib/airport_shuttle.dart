import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:asincronia/services/mockapi.dart';
import 'package:flutter/material.dart';
/*
APLICACIONES Móvil.
Nombres y Apellidos: Winter Aníbal Meza Jiménez.
Curso: Séptimo "A" 2022(2).
Práctica Guiada 2: Asincronia con Flutter.
Fecha: Domingo, 12 de diciembre de 2022.
Docente: Ing. Edgardo Panchana Flores, Mg.
 */
// Clase principal.
class airport_shuttle extends StatefulWidget {
  const airport_shuttle({Key? key}) : super(key: key);

  @override
  _ListStateScreen createState() => _ListStateScreen();
}

class _ListStateScreen extends State<airport_shuttle> {
  double _anchura = 0;
  int resultadobarra = 0;
  bool _activartexto = false;
  Color _color = Colors.orange;
  bool _Expandido = false;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Ink(
              width: 80,
              height: 80,
              decoration: const ShapeDecoration(
                color: Colors.orange,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.airport_shuttle,
                  color: Colors.black,
                  size: 50.0,
                ),
                color: Colors.white,
                onPressed: () async {
                  _alternarExpandir();
                  resultadobarra = await MockApi().getHyundaiInteger() as int;
                  actualizar();
                  await Future.delayed(Duration(seconds: 3));

                  _activartexto = true;

                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                  8.0), // add space of 8.0 logical pixels on all sides
              child: Text(""),
            ),
            AnimatedContainer(
              // Se usa setState para reconstruir el widget con valores nuevos.
              width: _Expandido ? _anchura : _anchura,
              height: 15,

              decoration: BoxDecoration(
                color: _color,
              ),
              // Aquí se define la duración de la animación.
              duration: Duration(seconds: _Expandido ? 3 : 0),

               // En este apartado nos proporciona una curva opcional
              // para hacer que la animación se sienta más suave.
            ),
            Padding(
              padding: EdgeInsets.all(
                  8.0), // add space of 8.0 logical pixels on all sides
              child: Text(""),
            ),
            Text(
              '${result().toString()}',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.orange),
            ),
          ],
        ));
  }

  actualizar() {
    setState(() {
      _anchura = 0;
      _Expandido = false;
    });
  }

  _alternarExpandir() {
    setState(() {
      _Expandido = !_Expandido;
      _anchura = 350;
    });
  }

  result() {
    return resultadobarra;
  }
}
