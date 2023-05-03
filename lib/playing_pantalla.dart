import 'package:wordle/wordle_logica.dart';
import 'package:flutter/material.dart';
import 'package:wordle/widget_teclado.dart';

class PlayingPantalla extends StatefulWidget {
  PlayingPantalla({Key? key}) : super(key: key);

  @override
  State<PlayingPantalla> createState() => _PlayingPantallaState();
}

class _PlayingPantallaState extends State<PlayingPantalla> {
  WordleLogica _partida = WordleLogica();

  @override
  void initState() {
    super.initState();
    WordleLogica.iniciarWordle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            WidgetTeclado(_partida),
            SizedBox(
              height: 30.0,
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
