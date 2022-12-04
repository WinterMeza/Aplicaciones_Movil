/*
APLICACIONES Móvil.
Nombres y Apellidos: Winter Aníbal Meza Jiménez.
Curso: Séptimo "A" 2022(2).
Práctica Guiada 1: Aplicación Mail en Flutter.
Fecha: Domingo, 4 de diciembre de 2022.
Docente: Ing. Edgardo Panchana Flores, Mg.
 */
// Se define la clase Email con los atributos del objeto.
class Email {
  final int id;
  final String from;
  final String subject;
  final DateTime dateTime;
  final String body;
  bool read;

  Email({
    required this.id,
    required this.from,
    required this.subject,
    required this.dateTime,
    required this.body,
    this.read = false,
  });
}
