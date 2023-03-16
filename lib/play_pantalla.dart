import 'package:flutter/material.dart';

class PlayPantalla extends StatefulWidget {
  const PlayPantalla({Key? key}) : super(key: key);

  @override
  State<PlayPantalla> createState() => _PlayPantallaState();
}

class _PlayPantallaState extends State<PlayPantalla> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  height: 100,
                  width: 100,
                  child: FloatingActionButton(
                      elevation: 5,
                      highlightElevation: 20,
                      onPressed: (){},
                      child: Icon(Icons.play_arrow,size: 100,color: Theme.of(context).iconTheme.color, )
                  )
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width:2, color: Theme.of(context).primaryColorDark),
                        borderRadius: BorderRadius.all(Radius.circular(4))
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Mejor racha',
                          ),
                          Text(
                            '#',
                            style: TextStyle(fontSize: Theme.of(context).textTheme.displayMedium?.fontSize),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(width:2, color: Theme.of(context).primaryColorDark),
                          borderRadius: BorderRadius.all(Radius.circular(4))
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Racha actual',
                          ),
                          Text(
                            '#',
                            style: TextStyle(fontSize: Theme.of(context).textTheme.displayMedium?.fontSize),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
