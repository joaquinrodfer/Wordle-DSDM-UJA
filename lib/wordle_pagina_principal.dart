import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'puntuaciones_pantalla.dart';
import 'play_pantalla.dart';
import 'configuracion_pantalla.dart';

class WordlePaginaPrincipal extends StatefulWidget {
  const WordlePaginaPrincipal({Key? key}) : super(key: key);

  @override
  State<WordlePaginaPrincipal> createState() => _WordlePaginaPrincipalState();
}

class _WordlePaginaPrincipalState extends State<WordlePaginaPrincipal> {
  final _controladorPagina = PageController(
      initialPage: 1,
      keepPage: true
  );
  int _categoriaActiva = 1;
  static var paginas = <Widget>[
    PuntuacionesPantalla(),
    PlayPantalla(),
    ConfiguracionPantalla()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controladorPagina,
        onPageChanged: (index){
          pageChanged(index);
        },
        children: [
          paginas[0],
          paginas[1],
          paginas[2]
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.ease,
        animationDuration: Duration(milliseconds: 350),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor!,
        color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor!,
        height: 60,
        index: _categoriaActiva,
        items: <Widget>[
          Icon(
              Icons.military_tech_outlined,
              size: 40,
              color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor
          ),
          Icon(
              Icons.play_circle_outline_outlined,
              size: 40,
              color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor
          ),
          Icon(
            Icons.settings,
            size: 40,
            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          ),
        ],
        onTap: _alPulsar,
      ),
    );
  }

  void _alPulsar(int index) {
    setState(() {
      _categoriaActiva = index;
      _controladorPagina.animateToPage(index, duration: Duration(milliseconds: 350), curve: Curves.ease);
    });
  }

  void pageChanged(int index) {
    setState(() {
      _categoriaActiva = index;
    });
  }
}
