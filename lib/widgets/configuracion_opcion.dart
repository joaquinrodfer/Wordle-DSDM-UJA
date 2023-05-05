import 'package:flutter/material.dart';

class ConfiguracionOpcion extends StatelessWidget {
  final String titulo;
  final String descripcion;

  const ConfiguracionOpcion({Key? key, required this.titulo, required this.descripcion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.grey[600],
        ),
        height: 110.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                const SizedBox(width: 8),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        titulo,
                        style: TextStyle(
                            color: Theme.of(context).primaryTextTheme.displaySmall?.color,
                            fontSize: Theme.of(context).primaryTextTheme.displaySmall?.fontSize,
                            fontFamily: Theme.of(context).primaryTextTheme.displaySmall?.fontFamily
                        ),
                      ),
                      RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Theme.of(context).primaryTextTheme.bodySmall?.color,
                                  fontSize: Theme.of(context).primaryTextTheme.bodySmall?.fontSize
                              ),
                              children: [
                                TextSpan(
                                  text: descripcion,
                                )
                              ]
                          )
                      )
                    ],
                  ),
                )
              ],
            ),
            Icon(
              Icons.keyboard_arrow_right,
              size: 40,
              color: Theme.of(context).primaryTextTheme.displaySmall?.color,
            )
          ],
        ),
      ),
    );
  }
}
