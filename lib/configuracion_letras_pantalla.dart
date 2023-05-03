import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:wordle/configuracion_pantalla.dart';

class ConfiguracionLetrasPantalla extends StatefulWidget {
  String _numeroLetras = "5";
  String get numeroLetras => _numeroLetras;

  ConfiguracionLetrasPantalla({Key? key}) : super(key: key);

  @override
  State<ConfiguracionLetrasPantalla> createState() => _ConfiguracionLetrasPantallaState();
}

class _ConfiguracionLetrasPantallaState extends State<ConfiguracionLetrasPantalla> {

  String dropdownValue = "4";
  final valoresAEscoger = [4, 5, 6, 7, 8];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                //Text('Número de letras',style: Theme.of(context).primaryTextTheme.displaySmall),
                const Center(
                  child: Text("Escoge el número de letras", style: TextStyle(
                    fontSize: 20
                  ),),
                 
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  items: <String>['4', '5', '6', '7', '8']
                          .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                      }).toList(),
                  onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                        
                      },
                ),
                const SizedBox(height: 60),
                SizedBox(
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
            
          ],
        ),
      ),
    );
  }
}
