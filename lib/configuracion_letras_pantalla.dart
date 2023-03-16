import 'package:flutter/material.dart';
import 'package:wordle/configuracion_pantalla.dart';

class ConfiguracionLetrasPantalla extends StatefulWidget {
  int _numeroLetras = 5;
  int get numeroLetras => _numeroLetras;

  ConfiguracionLetrasPantalla({Key? key}) : super(key: key);

  @override
  State<ConfiguracionLetrasPantalla> createState() => _ConfiguracionLetrasPantallaState();
}

class _ConfiguracionLetrasPantallaState extends State<ConfiguracionLetrasPantalla> {
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
                Text('Número de letras',style: Theme.of(context).primaryTextTheme.displaySmall),
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
