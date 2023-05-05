import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordle/utils/utils.dart';

class WordleLogica {
  static List<String> lista_palabras_4 = diccionario4;
  static List<String> lista_palabras_5 = diccionario5;
  static List<String> lista_palabras_6 = diccionario6;
  static List<List<String>> listas = [lista_palabras_4, lista_palabras_5, lista_palabras_6];

  int filaId = 0;
  int letraId = 0;
  static int nLetras = 5;
  static int nIntentos = 5;

  static String mensaje = "";
  static String palabra = "";

  static bool gameOver = false;
  static bool victoria = false;

  static List<Letra> fila = List.generate(nLetras, (index) => Letra("", 0));

  List<List<Letra>> tablero = List.generate(nIntentos, (index) => List.generate(nLetras, ((index) => Letra("", 0))));

  static void iniciarWordle() {
    cargarPreferencias();
    gameOver = false;
    mensaje = "";
    final random = Random();
    int index = random.nextInt(listas[nLetras-4].length);
    palabra = listas[nLetras-4][index];
    print(palabra);
  }

  void insertarPalabra(index, palabraInsertada) {
    tablero[filaId][index] = palabraInsertada;
  }
  bool compruebaPalabra(String palabraInsertada) {
    return listas[nLetras-4].contains(palabraInsertada);
  }

  int getNLetras() {
    return nLetras;
  }

  int getNIntentos() {
    return nIntentos;
  }

  bool isGameOver() {
    return gameOver;
  }

  void setNLetras(int anLetras) {
    nLetras = anLetras;
  }

  void reiniciarPartida() {
    var n = cargarPreferencias();
    fila = List.generate(nLetras, (index) => Letra("", 0));
    tablero = List.generate(nIntentos, (index) => List.generate(nLetras, ((index) => Letra("", 0))));
    gameOver = false;
    victoria = false;
    mensaje = "";
    final random = Random();
    int index = random.nextInt(listas[nLetras-4].length);
    palabra = listas[nLetras-4][index];
    print(palabra);
  }

  static cargarPreferencias() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nLetras = prefs.getInt("letras")!;
    nIntentos = prefs.getInt("intentos")!;
    print(nIntentos);
    return nLetras;
  }
}

class Letra {
  String? letra;
  int id = 0;
  Letra(this.letra, this.id);
}