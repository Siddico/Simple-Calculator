import 'package:calculator/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Calc());
}

class Calc extends StatelessWidget {
  const Calc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: CalcPage());
  }
}
