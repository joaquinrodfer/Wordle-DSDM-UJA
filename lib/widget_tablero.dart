import 'package:wordle/wordle_logica.dart';
import 'package:flutter/material.dart';

class WidgetTablero extends StatefulWidget {
  WidgetTablero(this.partida, {Key? key}) : super(key: key);
  WordleLogica partida;

  @override
  State<WidgetTablero> createState() => _WidgetTableroState();
}

class _WidgetTableroState extends State<WidgetTablero> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.partida.tablero.map((e) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: e.map((e) => Container(
          padding: EdgeInsets.all(16.0),
          width: 64.0,
          height: 64.0,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: e.id == 0
                  ? Colors.grey.shade800: e.id == 1
                  ? Colors.green.shade400
                  : Colors.amber.shade400
          ),
          child: Center(
            child: Text(
              e.letra!, style: TextStyle(
                color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold
              ),
            ),
          ),
        )).toList()
      )).toList(),
    );
  }
}
