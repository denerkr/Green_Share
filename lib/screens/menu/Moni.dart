import 'dart:developer';

import 'package:GreenShare/components/editor.dart';
import 'package:GreenShare/models/transferencia.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class Moni extends StatefulWidget {
  final int usuario;

  const Moni({Key key, this.usuario}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MoniState(usuario);
  }
}

class MoniState extends State<Moni> {
  final int usuario;
  MoniState(this.usuario);

  int _sampleString;
  double _sampleString2;
  double _sampleString3;

  void textReturn(String value) async {
    String pathbateria = "usuarios/residencia$usuario/monitoramento/bateria";
    String pathcarteira = "usuarios/residencia$usuario/monitoramento/suaCarteira";
    String pathtotal = "usuarios/residencia$usuario/monitoramento/totalGerado";
    int bateria = (await FirebaseDatabase.instance.reference().child(pathbateria).once()).value;
    double carteira = (await FirebaseDatabase.instance.reference().child(pathcarteira).once()).value;
    double total = (await FirebaseDatabase.instance.reference().child(pathtotal).once()).value;
    setState(() {
      _sampleString = bateria;
      _sampleString2 = carteira;
      _sampleString3 = total;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Monitoramento'),
        ),
        body: Center(
          child: Column(
            children: [
              RaisedButton(
                  child: Text('Buscar dados'),
                  onPressed: () => textReturn("usuario")
              ),
              Text("Bateria: $_sampleString kWh"),
              Text("Sua Carteira: $_sampleString2 gS"),
              Text("Total Gerado: $_sampleString3 kWh"),
            ],
          ),
        ));
}}
