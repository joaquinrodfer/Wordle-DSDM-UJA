import 'package:wordle/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:wordle/widgets/widgets.dart';

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
      body: WidgetTeclado(_partida),
    );
  }
}
