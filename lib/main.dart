import 'package:flutter/material.dart';
import 'package:flutter_pokedesk/paginas/home.dart';

void main() {
  runApp(Dog());
}

class Dog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}
