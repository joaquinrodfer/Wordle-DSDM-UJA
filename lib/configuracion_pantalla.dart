import 'package:flutter/material.dart';
import 'package:wordle/configuracion_opcion.dart';

class ConfiguracionPantalla extends StatelessWidget {
  final _opciones = <ConfiguracionOpcion>[
    const ConfiguracionOpcion(
      titulo: 'Número de letras',
      descripcion: 'Número de letras que tendrás que averiguar por cada palabra',
    ),
    const ConfiguracionOpcion(
      titulo: 'Número de intentos',
      descripcion: 'Número de intentos para resolver la palabra',
    ),
  ];

  ConfiguracionPantalla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
            child: IconButton(
              icon: Icon(
                Icons.settings,
                color: Theme.of(context).primaryColorDark,
                size: 40,
              ),
              onPressed: (){},
            )
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            _opciones[0],
            const SizedBox(height: 5,),
            _opciones[1]
          ],
        )
      ),
    );
  }
}

