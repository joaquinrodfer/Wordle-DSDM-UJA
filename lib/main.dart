import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wordle/wordle.dart';

void main () {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(new Wordle()); }
  );
}