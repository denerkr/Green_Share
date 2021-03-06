import 'package:GreenShare/screens/login/logincompelto.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

final databaseReference = FirebaseDatabase.instance.reference();

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
      home: LoginPage(),
    );
  }
}
