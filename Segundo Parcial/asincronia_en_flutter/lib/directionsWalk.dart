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
class directions_walk extends StatefulWidget {
  const directions_walk({Key? key}) : super(key: key);

  @override
  _ListStateScreen createState() => _ListStateScreen();
}

class _ListStateScreen extends State<directions_walk> {
  // Ststatic const String _title = 'Flutter Code Sample';
  double _anchura = 0;
  int resultadobarra = 0;
  bool _activartexto = false;
  Color _color = Colors.redAccent;
  bool _Expandir = false;
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
                color: Colors.redAccent,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.directions_walk,
                  color: Colors.black,
                  size: 50.0,
                ),
                color: Colors.white,
                onPressed: () async {
                  _alternarExpandir();
                  resultadobarra = await MockApi().getFisherPriceInteger() as int;
                  actualizar();
                  await Future.delayed(Duration(seconds: 10));

                  _activartexto = true;

                  // alternarExpandir nos da un color aleatorio.
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
              width: _Expandir ? _anchura : _anchura,
              height: 15,

              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              //  Aquí se define la duración de la animación.
              duration: Duration(seconds: _Expandir ? 10 : 0),

              // En este apartado nos proporciona una curva opcional
              // para hacer que la animación se sienta más suave.
            ),
            Padding(
              padding: EdgeInsets.all(
                  8.0), // add space of 8.0 logical pixels on all sides
              child: Text(""),
            ),
            Text(
              '${resultado().toString()}',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.redAccent),
            ),
          ],
        ));
  }

  actualizar() {
    setState(() {
      _anchura = 0;
      _Expandir = false;
    });
  }

  _alternarExpandir() {
    setState(() {
      _Expandir = !_Expandir;
      _anchura = 350;
    });
  }

  resultado() {
    return resultadobarra;
  }
}
