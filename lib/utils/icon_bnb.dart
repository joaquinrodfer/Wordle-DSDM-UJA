import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconBNB extends StatelessWidget {
  final IconData icon;

  const IconBNB({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
        icon,
        size: 40,
        color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor
    );
  }
}

