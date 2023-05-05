import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracionLetrasPantalla extends StatefulWidget {
  @override
  _ConfiguracionLetrasPantallaState createState() => _ConfiguracionLetrasPantallaState();
}

class _ConfiguracionLetrasPantallaState extends State<ConfiguracionLetrasPantalla> {
  int _selectedNumber = 4;
  final String _prefsKey = 'letras';

  @override
  void initState() {
    super.initState();
    _loadSelectedNumber();
  }

  Future<void> _loadSelectedNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedNumber = prefs.getInt(_prefsKey) ?? 5;
    });
  }

  Future<void> _saveSelectedNumber(int number) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_prefsKey, number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Theme.of(context).primaryColorDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/ico/ic_launcher.png',
              color: Theme.of(context).primaryColorDark,
              width: 40.0,
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Escoge el número de letras",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.displayMedium?.fontSize,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/10,),
            DropdownButton<int>(
              value: _selectedNumber,
              items: const [
                DropdownMenuItem(
                  value: 4,
                  child: Text('4 Letras'),
                ),
                DropdownMenuItem(
                  value: 5,
                  child: Text('5 Letras'),
                ),
                DropdownMenuItem(
                  value: 6,
                  child: Text('6 Letras'),
                ),
              ],
              onChanged: (int? value) {
                setState(() {
                  _selectedNumber = value!;
                  _saveSelectedNumber(_selectedNumber);
                });
              },
            ),
          ],
        )
      ),
    );
  }
}
