import 'package:flutter/material.dart';

class PlayingPantalla extends StatefulWidget {
  PlayingPantalla({Key? key}) : super(key: key);

  @override
  State<PlayingPantalla> createState() => _PlayingPantallaState();
}

class _PlayingPantallaState extends State<PlayingPantalla> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: [
                Text('Zona de juegos',style: Theme.of(context).primaryTextTheme.displaySmall),
                /*DropdownButton(
                  value: context
                  items: Items,
                  onChanged: (){}
                )*/
              ],
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
