import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:wordle/widgets/widget_tablero.dart';
import 'package:wordle/utils/utils.dart';

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
    double width = MediaQuery.of(context).size.width;
    late int letras = 5;
    late int intentos = 5;
    late double tamanioCaja;

    Future<int> _cargarNLetras() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      letras = prefs.getInt("letras") ?? 5;
      intentos = prefs.getInt("intentos") ?? 5;
      return letras;
    }

    if(intentos < 8) {
      tamanioCaja = 10;
    } else {
      tamanioCaja = 0;
    }

    setState(() {
      widget.partida.setNLetras(letras);
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Theme.of(context).primaryColorDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/ico/ic_launcher.png',
              color: Theme.of(context).primaryColorDark,
              width: 40.0,
            )
          ],
        ),
      ),
      body: FutureBuilder<int>(
        future: _cargarNLetras(),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasData) {
            widget.partida.setNLetras(letras);
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(),
                WidgetTablero(widget.partida, letras, intentos),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: fila1.map((e) {
                          return InkWell(
                            onTap: () {
                              print(e);
                              if(widget.partida.letraId < widget.partida.getNLetras() && !widget.partida.isGameOver()) {
                                setState(() {
                                  widget.partida.insertarPalabra(widget.partida.letraId, Letra(e,0));
                                  widget.partida.letraId++;
                                });
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(width * 0.025),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.grey.shade300
                              ),
                              child: Text("${e}", style: TextStyle(
                                color: Colors.grey[850],
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: fila2.map((e) {
                          return InkWell(
                            onTap: () {
                              print(widget.partida.isGameOver());
                              print(e);
                              if(widget.partida.letraId < widget.partida.getNLetras() && !widget.partida.isGameOver()) {
                                setState(() {
                                  widget.partida.insertarPalabra(widget.partida.letraId, Letra(e,0));
                                  widget.partida.letraId++;
                                });
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(width * 0.025),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.grey.shade300
                              ),
                              child: Text("${e}", style: TextStyle(
                                color: Colors.grey[850],
                                fontSize: width * 0.04,
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
                              if(e == "DEL" && !widget.partida.isGameOver()) {
                                if(widget.partida.letraId > 0) {
                                  setState(() {
                                    widget.partida.insertarPalabra(widget.partida.letraId-1, Letra("", 0));
                                    widget.partida.letraId--;
                                  });
                                }
                              } else if (e == "ENTER" && !widget.partida.isGameOver()) {
                                print(widget.partida.filaId);
                                print(widget.partida.getNIntentos());
                                if(widget.partida.letraId >= widget.partida.getNLetras()) {
                                  String intento = widget.partida.tablero[widget.partida
                                      .filaId].map((e) => e.letra).join();
                                  if (widget.partida.compruebaPalabra(intento)) {
                                    if (intento == WordleLogica.palabra) {
                                      setState(() {
                                        print("VICTORIA");
                                        WordleLogica.mensaje = "Has ganado!🎉";
                                        WordleLogica.victoria = true;
                                        WordleLogica.gameOver = true;
                                        mostrarAlerta(context);
                                        widget.partida.tablero[widget.partida.filaId].forEach((element) {
                                          element.id = 1;
                                        });
                                      });
                                    } else if (widget.partida.filaId+1 == widget.partida.getNIntentos()){
                                      WordleLogica.victoria = false;
                                      WordleLogica.gameOver = true;
                                      mostrarAlerta(context);
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
                                    setState(() {
                                      mostrarScaffold("La palabra no existe o no se encuentra");
                                      print("NOTFOUND");
                                      WordleLogica.mensaje = "No existe la palabra";
                                    });
                                  }
                                } else {
                                  mostrarScaffold("Longitud de palabra menor a la necesaria");
                                }
                              } else if(widget.partida.letraId < widget.partida.getNLetras() && !widget.partida.isGameOver()) {
                                setState(() {
                                  widget.partida.insertarPalabra(widget.partida.letraId, Letra(e,0));
                                  widget.partida.letraId++;
                                });
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(width * 0.025),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.grey.shade300
                              ),
                              child: Text("${e}", style: TextStyle(
                                color: Colors.grey[850],
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20,)
                    ],
                  ),
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  mostrarAlerta(BuildContext context) {
    if(WordleLogica.victoria){
      crearAlerta("HAS GANADO!!!🏆","La palabra era ${WordleLogica.palabra}");
    } else {
      crearAlerta("HAS PERDIDO!!!❌","La palabra era ${WordleLogica.palabra}");
    }
  }

  mostrarScaffold(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(mensaje),
          closeIconColor: Theme.of(context).primaryColor,
          dismissDirection: DismissDirection.vertical,
          duration: Duration(milliseconds: 1500),
          margin: EdgeInsets.only(left: 20, right: 20,bottom: MediaQuery.of(context).size.height - 100),
          showCloseIcon: true,
        ));
  }

  crearAlerta(String titulo, String mensaje) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          titulo,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: Theme.of(context).textTheme.displayLarge?.fontFamily,
          ),
        ),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              mensaje,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: Theme.of(context).textTheme.displayMedium?.fontFamily,
                fontSize: Theme.of(context).textTheme.displayMedium?.fontSize,
              ),
            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Theme.of(context).primaryColorDark,
                  child: IconButton(
                      icon: Icon(
                        Icons.home,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () => setState(() {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      })
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Theme.of(context).primaryColorDark,
                  child: IconButton(
                      icon: Icon(
                        Icons.restart_alt,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () => setState(() {
                        for(int i = 0; i < widget.partida.getNLetras(); i++) {
                          widget.partida.tablero[widget.partida.filaId][i].id = 0;
                          widget.partida.tablero[widget.partida.filaId][i].letra = "";
                        }
                        widget.partida.filaId = 0;
                        widget.partida.letraId = 0;
                        widget.partida.reiniciarPartida();
                        Navigator.of(context).pop();
                      })
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
