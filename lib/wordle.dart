import 'package:flutter/material.dart';
import 'wordle_tema.dart';
import 'wordle_pagina_principal.dart';

class Wordle extends StatelessWidget {
  const Wordle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wordle',
      theme: WordleTema.claro(),
      darkTheme: WordleTema.oscuro(),
      themeMode: ThemeMode.system,
      home: const WordlePaginaPrincipal(),
    );
  }
}
