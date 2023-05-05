import 'package:flutter/material.dart';
import 'package:wordle/widgets/configuracion_opcion.dart';
import 'package:wordle/pantallas/pantallas.dart';

class ConfiguracionPantalla extends StatelessWidget {
  final _longitudPalabra = [4,5,6];
  int _idLongitudPalabras = 0;
  final _numeroIntentos = [4,5,6,7,8];
  int _idNumeroIntentos = 0;

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
            child: Icon(
              Icons.settings,
              color: Theme.of(context).primaryColorDark,
              size: 40,
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
            InkWell(
              child: _opciones[0],
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) {
                          return ConfiguracionLetrasPantalla();
                        }
                    )
                );
              },
            ),
            const SizedBox(height: 5,),
            InkWell(
              child: _opciones[1],
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ConfiguracionIntentosPantalla();
                    })
                );
              },
            ),
          ],
        )
      ),
    );
  }
}

