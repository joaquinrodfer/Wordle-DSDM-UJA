import 'package:wordle/widget_tablero.dart';
import 'package:wordle/wordle_logica.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetTeclado extends StatefulWidget {
  WidgetTeclado(this.partida, {Key? key}) : super(key: key);
  WordleLogica partida;

  @override
  State<WidgetTeclado> createState() => _WidgetTecladoState();
}

class _WidgetTecladoState extends State<WidgetTeclado> {
  List fila1 = "QWERTYUIOP".split("");
  List fila2 = "ASDFGHJKLÑ".split("");
  List fila3 = ["DEL","Z","X","C","V","B","N","M","ENTER"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          WordleLogica.mensaje,
          style: TextStyle(
              color: Colors.white
          ),
        ),
        WidgetTablero(widget.partida),
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: fila1.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                if(widget.partida.letraId < 5) {
                  setState(() {
                    widget.partida.insertarPalabra(widget.partida.letraId, Letra(e,0));
                    widget.partida.letraId++;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.shade300
                ),
                child: Text("${e}", style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: fila2.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                if(widget.partida.letraId < 5) {
                  setState(() {
                    widget.partida.insertarPalabra(widget.partida.letraId, Letra(e,0));
                    widget.partida.letraId++;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.shade300
                ),
                child: Text("${e}", style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: fila3.map((e) {
            return InkWell(
              onTap: () {
                print(e);
                if(e == "DEL") {
                  if(widget.partida.letraId > 0) {
                    setState(() {
                      widget.partida.insertarPalabra(widget.partida.letraId-1, Letra("", 0));
                      widget.partida.letraId--;
                    });
                  }
                } else if (e == "ENTER") {
                  if(widget.partida.letraId >= 5) {
                    String intento = widget.partida.tablero[widget.partida
                        .filaId].map((e) => e.letra).join();
                    if (widget.partida.compruebaPalabra(intento)) {
                      if (intento == WordleLogica.palabra) {
                        setState(() {
                          print("VICTORIA");
                          WordleLogica.mensaje = "OLE TU POLLICA";
                          widget.partida.tablero[widget.partida.filaId].forEach((element) {
                            element.id = 1;
                          });
                        });
                      } else {
                        int longitudIntento = intento.length;
                        for(int i = 0; i < longitudIntento; i++) {
                          String char =  intento[i];
                          if(WordleLogica.palabra.contains(char)) {
                            if(WordleLogica.palabra[i] == char) {
                              setState(() {
                                widget.partida.tablero[widget.partida.filaId][i].id = 1;
                              });
                            } else {
                              setState(() {
                                widget.partida.tablero[widget.partida.filaId][i].id = 2;
                              });
                            }
                          }
                        }
                        widget.partida.filaId++;
                        widget.partida.letraId = 0;
                      }
                    } else {
                      print("NOTFOUND");
                      WordleLogica.mensaje = "No existe la palabra";
                    }
                  }
                } else if(widget.partida.letraId < 5) {
                  setState(() {
                    widget.partida.insertarPalabra(widget.partida.letraId, Letra(e,0));
                    widget.partida.letraId++;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.grey.shade300
                ),
                child: Text("${e}", style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
