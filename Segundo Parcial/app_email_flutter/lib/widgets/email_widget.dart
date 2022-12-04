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
// Aqui se declaran las clases con sus respectivas funciones para darle navegavilidad y funcionalidad a los Widgets.
class EmailWidget extends StatelessWidget {
  final Email email;
  final Function onTap;
  final Function onSwipe;
  final Function onLongPress;

  const EmailWidget(
      {Key? key,
      required this.email,
      required this.onTap,
      required this.onSwipe,
      required this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        onSwipe(email.id);
      },
      onLongPress: () {
        onLongPress(email.id);
      },
      onTap: () {
        onTap(email);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 80.0,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 12.0,
                decoration: BoxDecoration(
                    color: email.read ? Colors.transparent : primaryColor,
                    shape: BoxShape.circle),
              ),
            ),
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(email.dateTime.toString().substring(0, 10),
                      style: dateTextStyle),
                  Text(email.from, style: fromTextStyle),
                  Text(email.subject, style: subjectTextStyle),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
