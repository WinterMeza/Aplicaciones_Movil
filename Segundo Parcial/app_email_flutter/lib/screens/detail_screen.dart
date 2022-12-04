import 'package:flutter/material.dart';

import '../constants.dart';
import '../model/email.dart';
/*
APLICACIONES Móvil.
Nombres y Apellidos: Winter Aníbal Meza Jiménez.
Curso: Séptimo "A" 2022(2).
Práctica Guiada 1: Aplicación Mail en Flutter.
Fecha: Domingo, 4 de diciembre de 2022.
Docente: Ing. Edgardo Panchana Flores, Mg.
 */
class DetailScreen extends StatelessWidget {
  final Email email;

  const DetailScreen({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(email.subject),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('From: ${email.from}', style: fromTextStyle),
              const SizedBox(height: 10.0),
              const Divider(color: primaryColor),
              const SizedBox(height: 10.0),
              Text(email.subject, style: subjectTextStyle),
              const SizedBox(height: 5.0),
              Text(email.dateTime.toString().substring(0, 16), style: dateTextStyle),
              const SizedBox(height: 10.0),
              const Divider(color: primaryColor),
              const SizedBox(height: 10.0),
              Text(email.body, style: bodyTextStyle),
            ],
          ),
        ));
  }
}
