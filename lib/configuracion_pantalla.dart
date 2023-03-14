import 'package:flutter/material.dart';

class ConfiguracionPantalla extends StatefulWidget {
  const ConfiguracionPantalla({Key? key}) : super(key: key);

  @override
  State<ConfiguracionPantalla> createState() => _ConfiguracionPantallaState();
}

class _ConfiguracionPantallaState extends State<ConfiguracionPantalla> {
  @override
  Widget build(BuildContext context) {
    return const Center(
            child: Text('Pagina configuración en progreso⚙')
    );
  }
}
