import 'dart:math';

class WordleLogica {
  int filaId = 0;
  int letraId = 0;
  int nLetras = 4;
  int nIntentos = 6;

  static String mensaje = "";
  static String palabra = "";
  static List<String> lista_palabras_4 = ["PITO", "ANOS"];
  static List<String> lista_palabras_5 = ["MUNDO", "LUCHA", "PATOS"];
  static List<String> lista_palabras_6 = ["MAMITA", "TOTITO"];
  static bool gameOver = false;

  static List<Letra> fila = List.generate(5, (index) => Letra("", 0));

  List<List<Letra>> tablero = List.generate(5, (index) => List.generate(5, ((index) => Letra("", 0))));

  static void iniciarWordle() {
    final random = Random();
    int index = random.nextInt(lista_palabras_5.length);
    palabra = lista_palabras_5[index];
  }

  void insertarPalabra(index, palabraInsertada) {
    tablero[filaId][index] = palabraInsertada;
  }
  bool compruebaPalabra(String palabraInsertada) {
    return lista_palabras_5.contains(palabraInsertada);
  }
}

class Letra {
  String? letra;
  int id = 0;
  Letra(this.letra, this.id);
}