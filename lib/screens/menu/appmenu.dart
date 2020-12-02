import 'package:GreenShare/models/transferencia.dart';
import 'package:GreenShare/screens/transferencia/formulario.dart';
import 'package:GreenShare/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:GreenShare/screens/menu/homepagecharts.dart';
import 'package:GreenShare/screens/login/logincompelto.dart';

import '../../main.dart';

class Menu extends StatefulWidget {
  int casa;

  Menu({this.casa});

  @override
  State<StatefulWidget> createState() {
    return MenuState();
  }
}

class MenuState extends State<Menu> {
  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              RaisedButton(
                  child: Text('Alterar valor de compra e venda'),
                  onPressed: () {
                    final Future<Transferencia> future = Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                      return FormularioTransferencia();
                    }));
                  }),
              RaisedButton(
                  child: Text('Modo Manual'),
                  onPressed: () => modoManual()
              ),
              RaisedButton(
                  child: Text('Modo Automatico'),
                  onPressed: () => modoAuto(),
              ),
              RaisedButton(
                  child: Text('Graficos'),
                  onPressed: () {
                    final Future<Transferencia> future = Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }));
                  }),
            ],
          ),
        ));
  }}

void modoManual() async {
  debugPrint('chegou no modomanual:');
    databaseReference.child('usuarios/residencia7/configuracoes').update({'Modo': '1'});
  }

void modoAuto() async {
  debugPrint('chegou no modoautomatico:');
  databaseReference.child('usuarios/residencia7/configuracoes').update({'Modo': '0'});
}