import 'package:GreenShare/screens/login/telalogin.dart';
import 'package:GreenShare/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(GreenShareApp());

class GreenShareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: TelaLogin(),
    );
  }
}
