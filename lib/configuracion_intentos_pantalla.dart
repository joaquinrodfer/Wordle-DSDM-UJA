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
   String dropdownValue = "4";

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
                  child: Text("Escoge el número de intentos", style: TextStyle(
                    fontSize: 28,
                  ),),
                 
                ),
                const SizedBox(height: 50),
                DropdownButton<String>(
                  iconSize: 50,
                  style: const TextStyle(fontSize: 35, color: Colors.black),
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
                const SizedBox(height: 50),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: Align(
                    alignment: Alignment.bottomCenter,
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
                )
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
