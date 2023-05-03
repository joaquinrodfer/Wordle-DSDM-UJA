import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetTeclado extends StatefulWidget {
  const WidgetTeclado({Key? key}) : super(key: key);

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: fila1.map((e) {
            return InkWell(
              onTap: () {
                print(e);
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
