import 'package:wordle/utils/utils.dart';
import 'package:flutter/material.dart';

class WidgetTablero extends StatefulWidget {
  WidgetTablero(this.partida, this.nLetras, this.nIntentos, {Key? key}) : super(key: key) {
    if(nLetras == 6 || nIntentos >= 7) {
      multiplo = 0.7;
    } else {
      multiplo = 1;
    }
  }

  WordleLogica partida;
  int nLetras;
  int nIntentos;
  late double multiplo;

  @override
  State<WidgetTablero> createState() => _WidgetTableroState();
}

class _WidgetTableroState extends State<WidgetTablero> {
  @override
  Widget build(BuildContext context) {
    if(MediaQuery.of(context).size.height - MediaQuery.of(context).size.width < 450){
      widget.multiplo = 0.7;
    }

    return Column(
      children: widget.partida.tablero.map((e) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: e.map((e) => Container(
          padding: EdgeInsets.all(16.0 * widget.multiplo / MediaQuery.of(context).size.width),
          width: MediaQuery.of(context).size.width/6.5 * widget.multiplo,
          height: MediaQuery.of(context).size.width/6.5 * widget.multiplo,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              color: e.id == 0
                  ? Theme.of(context).backgroundColor: e.id == 1
                  ? Colors.green.shade400
                  : Colors.amber.shade400
          ),
          child: Center(
            child: Text(
              e.letra!, style: TextStyle(
                color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.08, fontWeight: FontWeight.bold
              ),
            ),
          ),
        )).toList()
      )).toList(),
    );
  }
}
