import 'package:flutter/material.dart';

import '../constants.dart';
import '../model/backend.dart';
import '../model/email.dart';
import '../widgets/email_widget.dart';
import 'detail_screen.dart';
/*
APLICACIONES Móvil.
Nombres y Apellidos: Winter Aníbal Meza Jiménez.
Curso: Séptimo "A" 2022(2).
Práctica Guiada 1: Aplicación Mail en Flutter.
Fecha: Domingo, 4 de diciembre de 2022.
Docente: Ing. Edgardo Panchana Flores, Mg.
 */
class ListScreen extends StatefulWidget {
  const ListScreen({Key? key, required this.title}) : super(key: key);

  // Este widget se refiere a la página de inicio de la aplicación. Es con estado, lo que significa
  // que tiene un objeto State que se define a continuación y que contiene campos que afectan como luce .

 
  //  Los campos en una subclase de Widget son siempre marcado como "final".

  final String title;

  @override
  _ListScreenState createState() => _ListScreenState();
}
  // Esta clase es para la configuración del estado. Contiene los valores que en este caso es el título provisto por
  // el padre que en este caso, el widget de la aplicación y utilizado por el método de construcción del Estado.
class _ListScreenState extends State<ListScreen> {
  // State.
  var emails = Backend().getEmails();

  void markEmailAsRead(int id) {
    Backend().markEmailAsRead(id);
    setState(() {
      emails = Backend().getEmails();
    });
  }

  void deleteEmail(int id) {
    Backend().deleteEmail(id);
    setState(() {
      emails = Backend().getEmails();
    });
  }

  void showDetail(Email email) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailScreen(email: email);
    }));

    Backend().markEmailAsRead(email.id);
    setState(() {
      emails = Backend().getEmails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: emails.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: primaryColor,
          indent: 40.0,
          endIndent: 20.0,
        ),
        itemBuilder: (BuildContext context, int index) => EmailWidget(
          email: emails[index],
          onTap: showDetail,
          onLongPress: markEmailAsRead,
          onSwipe: deleteEmail,
        ),
      ),
    );
  }
}
