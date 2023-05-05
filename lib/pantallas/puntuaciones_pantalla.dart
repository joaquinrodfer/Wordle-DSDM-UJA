import 'package:flutter/material.dart';

class PuntuacionesPantalla extends StatefulWidget {
  const PuntuacionesPantalla({Key? key}) : super(key: key);

  @override
  State<PuntuacionesPantalla> createState() => _PuntuacionesPantallaState();
}

class _PuntuacionesPantallaState extends State<PuntuacionesPantalla> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Pagina puntuaciones en progreso⚙')
    );
  }
}
