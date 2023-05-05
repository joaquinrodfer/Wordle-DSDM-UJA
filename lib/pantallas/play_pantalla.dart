import 'package:flutter/material.dart';
import 'package:wordle/pantallas/pantallas.dart';

class PlayPantalla extends StatefulWidget {
  const PlayPantalla({Key? key}) : super(key: key);

  @override
  State<PlayPantalla> createState() => _PlayPantallaState();
}

class _PlayPantallaState extends State<PlayPantalla> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          FloatingActionButton(
            splashColor: Theme.of(context).appBarTheme.backgroundColor,
            elevation: 0,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            child: Icon(
              Icons.error_outline,
              color: Colors.red.shade800,
              size: 50,
            ),
            onPressed:(){ showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("ERRORES CONOCIDOS NO RESUELTOS:"),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(child: Text("- Al comenzar una partida no se actualizan los valores introducidos en la configuración, es necesario salir y volver a entrar para ver la configuración deseada")),
                      SizedBox(height: 20,),
                      FloatingActionButton(
                        splashColor: Theme.of(context).appBarTheme.backgroundColor,
                        child: Icon(
                          Icons.close
                        ),
                        onPressed: Navigator.of(context).pop
                      )
                    ],
                  ),
                );
              }
            );
          })
        ],
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Wordle',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 32.0),
              SizedBox(
                  height: 150,
                  width: 150,
                  child: FloatingActionButton(
                    elevation: 5,
                    highlightElevation: 20,
                    onPressed: (){
                      Navigator.push(
                        context,
                          MaterialPageRoute(
                              builder: (context) {
                                return PlayingPantalla();
                              }
                          )
                      );
                    },
                    child: Icon(Icons.play_arrow,size: 130,color: Theme.of(context).iconTheme.color, )
                  )
              ),
            ],
          )
      ),
    );
  }
}
