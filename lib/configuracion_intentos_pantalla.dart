import 'package:flutter/material.dart';
import 'package:wordle/configuracion_pantalla.dart';

class ConfiguracionIntentosPantalla extends StatefulWidget {
  int _numeroIntentos = 6;
  int get numeroIntentos => _numeroIntentos;

  ConfiguracionIntentosPantalla({Key? key}) : super(key: key);

  @override
  State<ConfiguracionIntentosPantalla> createState() => _ConfiguracionLetrasPantallaState();
}

class _ConfiguracionLetrasPantallaState extends State<ConfiguracionIntentosPantalla> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: [
                Text('Número de intentos',style: Theme.of(context).primaryTextTheme.displaySmall),
                /*DropdownButton(
                  value: context
                  items: Items,
                  onChanged: (){}
                )*/
              ],
            ),
            Container(
              height: 60,
              width: 60,
              child: FloatingActionButton(
                  backgroundColor: Theme.of(context).primaryColorDark,
                  child: Icon(
                    Icons.arrow_back,
                    size: 40,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
