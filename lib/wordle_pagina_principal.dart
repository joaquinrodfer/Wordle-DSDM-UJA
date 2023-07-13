import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wordle/pantallas/pantallas.dart';
import 'package:wordle/utils/utils.dart';

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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor!,
        height: 60,
        index: _categoriaActiva,
        items: const <Widget>[
          IconBNB(icon: Icons.military_tech_outlined),
          IconBNB(icon: Icons.play_circle_outline_outlined),
          IconBNB(icon: Icons.settings),
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
